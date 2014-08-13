module RuGGby
  module Action
    # Sending message action
    class CreateMessage < Base
      def initialize(client, uin, message)
        @client = client
        @block = client.actions[:create_message]
        @uin = uin
        @message = message
      end

      def run!
        @client.logger.debug('RuGGby::Action::CreateMessage')

        msg = Packet::Outgoing::Message.new(@uin, @message)
        @client.socket.write(msg)
        @block.call(@uin, @message) if @block
      end
    end
  end
end
