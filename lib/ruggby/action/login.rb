module RuGGby

  module Action

    # Login action - will log user in to a GG account
    class Login < Base

      def initialize(client)
        @client = client
        @block  = client.actions[:login]
      end

      def run!
        @client.logger.debug('RuGGby::Action::Login')

        welcome = RuGGby::Packet::Factory.new(@client.socket).build

        login = Packet::Outgoing::Login.new(
          :uin         => @client.login,
          :hash        => Password.hash(@client.password, welcome.seed),
          :status      => @client.status,
          :description => @client.description
        )

        @client.logger.debug('RuGGby::Action::Login sending Login packet')
        @client.socket.write(login)

        login_status = RuGGby::Packet::Factory.new(@client.socket).build

        @client.logger.debug("RuGGby::Action::Login #{login_status.class}")
        
        @client.logged = login_status.successful?
        @block.call if @block
      end

    end

  end

end
