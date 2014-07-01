module RuGGby

  module Action

    # Ping action
    # In order to maintaine a TCP connection with GG server, we need to send
    # a ping from time to time.
    # This is done in a background thread (don't need to worry about it
    # just ignite it and forget ;) )
    class Ping < Base

      SLEEP_TIME = 180

      def initialize(client)
        @client = client
        @block = client.actions[:ping]
      end

      def run!
        @client.loops[:ping] = Thread.new do
          begin
            loop do
              @client.logger.info('RuGGby::Action::Ping')
              ping = Packet::Outgoing::Ping.new
              @client.socket.write(ping)
              sleep SLEEP_TIME
              @block.call if @block
            end
          rescue => e
            @client.logger.fatal("RuGGby::Action::Ping #{e}")
            raise e
          end
        end
      end

    end

  end

end
