module RuGGby
  module Action
    # Action invoken when new message occures
    class NewMessage < Base
      attr_reader :uin, :message

      def initialize(client, data)
        @client = client
        @block = client.actions[:new_message]
        @uin = data[0]
        @created_at = Time.at(data[2])
        @message = StringEncoder.complex(data[4])
      end

      def run!
        @client.logger.debug('RuGGby::Action::NewMessage')

        @block.call(@uin, @created_at, @message) if @block
      end
    end
  end
end
