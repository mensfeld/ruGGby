module RuGGby

  module Action

    # Action invoken when we want to change status
    class ChangeStatus < Base

      attr_reader :status, :description

      def initialize(client, status, description)
        @client = client
        @block = client.actions[:change_status]
        @status = status
        @description = description
      end

      def run!
        @client.logger.debug('RuGGby::Action::ChangeStatus')

        msg = Packet::Outgoing::ChangeStatus.new(@status, @description)
        @client.socket.write(msg)

        @block.call(@status, @description) if @block
      end

    end

  end

end
