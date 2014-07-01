module RuGGby

  module Action

    # Send a "mark" message
    # If we don't download GG friends list, we need to send a mark anyway
    class Mark < Base

      def initialize(client)
        @client = client
        @block = client.actions[:mark]
      end

      # Send a mark packet
      def run!
        @client.logger.debug('RuGGby::Action::Mark')

        mark = Packet::Outgoing::Mark.new
        @client.socket.write(mark)
        @block.call if @block
      end

    end

  end

end
