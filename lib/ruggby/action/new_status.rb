module RuGGby
  module Action
    # Action invoken when new message occures
    class NewStatus < Base
      attr_reader :uin, :status

      def initialize(client, data)
        @client = client
        @block = client.actions[:status_changed]
        @uin = data[0]
        @status = data[1]
      end

      def run!
        return unless @uin
        return unless @status

        @client.logger.debug('RuGGby::Action::NewStatus')
        @status = RuGGby::Converter::FROM_STATUS[@status]
        @block.call(@uin, @status) if @block
      end
    end
  end
end
