module RuGGby

  module Action

    class CheckUinStatus < Base

      def initialize(client, uin)
        @client = client
        @uin = uin
      end

      def run!
        @client.logger.debug('RuGGby::Action::CheckUinStatus')

        msg = Packet::Outgoing::CheckUinStatus.new(@uin)
        @client.socket.write(msg)

        @block.call(@uin) if @block
      end

    end

  end

end
