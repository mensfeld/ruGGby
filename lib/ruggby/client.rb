module RuGGby

  # The main GG bot class used to control our GG bot
  class Client

    include Callback

    class << self
      attr_accessor :logger
      attr_accessor :log_level
    end

    @logger    ||= RuGGby::Logger
    @log_level ||= :debug

    attr_reader :socket, :password
    attr_writer :logged
    attr_accessor :loops, :actions, :threads, :reconnect, :status, 
      :description, :login, :logger

    def initialize()
      @loops   = {}
      @actions = {}
      @threads = []
      @logged  = false
      @logger  = self.class.logger.new(self.class.log_level)

      @logger.debug('RuGGby::Client initialized')
    end

    def login!(gg_nr, password, params = {})
      @logger.debug('RuGGby::Client login in')

      @login       = gg_nr
      @password    = password
      @status      = params[:status] || :available
      @description = params[:description]

      if logged?
        @logger.info('RuGGby::Client already logged')
        return true
      end

      @logger.debug('RuGGby::Client creating socket')

      @socket = Socket.new(@login)

      begin
        RuGGby::Action::Login.new(self).run!
      rescue => e
        @logger.info("RuGGby::Client login failed")
        @logger.error("RuGGby::Client #{e}")

        @logged = false
      end

      if logged?
        RuGGby::Action::Mark.new(self).run!
        RuGGby::Action::Ping.new(self).run!
        RuGGby::Action::Read.new(self).run!
      end
      
      @logged
    end

    def logged?
      @logged
    end

    def logout!
      @logger.debug('RuGGby::Client logout')

      @threads.each { |t| t.exit    }
      @loops.each   { |k, v| v.exit }
      @socket.close
      @logged = false
    end

    def change_status(status, description = '')
      RuGGby::Action::ChangeStatus.new(self, status, description).run!
    end

    def message(uin, message)
      @logger.debug('RuGGby::Client message')

      RuGGby::Action::CreateMessage.new(self, uin, message).run!
    end

    def wait
      @loops[:ping].join
    end

    def check_uin_status(uin)
      @logger.debug('RuGGby::Client message')

      RuGGby::Action::CheckUinStatus.new(self, uin).run!
    end

  end

end
