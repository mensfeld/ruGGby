module RuGGby
  module Action
    # Action reading from socket - will check every SLEEP_TIME if there is a
    # data in TCPSocket
    class Read < Base
      # How long should it wait between socker reading attemps
      SLEEP_TIME = 0.2

      def initialize(client)
        @client = client
        @block = client.actions[:read]
      end

      # Start a thread that reads data and if there is any data - try to create
      # an appropriate packet and if successful will create a thread that
      # handles an callback
      def run!
        @client.loops[:read] = Thread.new do
          @client.logger.debug('RuGGby::Action::Read')
          begin
            loop do
              sleep SLEEP_TIME

              if (el = RuGGby::Packet::Factory.new(@client.socket).build)
                @client.logger.info("RuGGby::Action::Read - type: #{el.class::TYPE}")

                case RuGGby::Converter.action(el.class::TYPE)
                when :new_message then
                  action = RuGGby::Action::NewMessage.new(@client, el.data)
                  Threader.run(@client, action)
                when :status_changed then
                  action = RuGGby::Action::NewStatus.new(@client, el.data)
                  Threader.run(@client, action)
                end

                @block.call(el) if @block
              end
            end
          rescue => e
            @client.logger.fatal("RuGGby::Action::Read #{e}")
            raise e
          end
        end
      end
    end
  end
end
