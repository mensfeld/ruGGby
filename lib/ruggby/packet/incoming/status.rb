module RuGGby
  module Packet
    module Incoming
      # Packet containing and incoming message
      # Message packet contains not formatted data (not parsed, etc) so
      class Status < RuGGby::Packet::Incoming::Base
        TYPE = 0x0036
        TYPE_2 = 0x0037
        PATTERN = 'LLa*'

        attr_reader :uin, :status

        def initialize(data)
          super
          @uin = @data[0]
          @status = @data[1]
        end

        private

        def pattern
          PATTERN
        end
      end
    end
  end
end
