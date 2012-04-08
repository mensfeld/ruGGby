autoload :Iconv, 'iconv'


module RuGGby

  # Methods used to do stuff on the strings
  class StringEncoder

    INPUT  = 'UTF-8'
    OUTPUT = 'windows-1250'

    STRIP_REGEXP = /<span.*?>(.*)<\/span>/ix

    # Convert message into INPUT format
    def self.to_input(msg)
      msg.force_encoding(INPUT)
    rescue
      msg
    end

    # Convert message to OUTPUT format
    def self.to_output(msg)
      Iconv.iconv(OUTPUT, INPUT, msg).first.to_s
    rescue
      msg
    end

    # String all the tags and live the pure GG message
    def self.strip(msg)
      msg.scan(STRIP_REGEXP).first.first
    rescue
      msg
    end

    # Perform both strip and utf8 conversion
    def self.complex(msg)
      add_newlines(to_input(strip(msg)))
    end

    def self.add_newlines(msg)
      msg.gsub('<br>', "\r\n")
    end
  end

end