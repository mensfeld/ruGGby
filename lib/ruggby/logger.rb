module RuGGby
  # RuGGby default logger
  class Logger
    DEBUG = 0
    INFO  = 1
    ERROR = 2
    FATAL = 3

    LEVEL_MAP = {
      debug: DEBUG,
      info:  INFO,
      error: ERROR,
      fatal: FATAL
    }

    # Available log levels
    # => debug
    # => error
    # => fatal
    def initialize(level)
      @level = LEVEL_MAP[level]
    end

    # Returns +true+ iff the current level allows for the printing of
    # +DEBUG+ messages.
    def debug?
      @level <= DEBUG
    end

    # Returns +true+ iff the current level allows for the printing of
    # +INFO+ messages.
    def info?
      @level <= INFO
    end

    # Returns +true+ iff the current level allows for the printing of
    # +ERROR+ messages.
    def error?
      @level <= ERROR
    end

    # Returns +true+ iff the current level allows for the printing of
    # +FATAL+ messages.
    def fatal?
      @level <= FATAL
    end

    def debug(msg)
      handle_message(msg, :debug)
    end

    def info(msg)
      handle_message(msg, :info)
    end

    def error(msg)
      handle_message(msg, :error)
    end

    def fatal(msg)
      handle_message(msg, :fatal)
    end

    private

    def handle_message(msg, level)
      printf("%-6s %s\n", level.upcase.to_s + ':', msg) if send(:"#{level}?")
    end
  end
end
