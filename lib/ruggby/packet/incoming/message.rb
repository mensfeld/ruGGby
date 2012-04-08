module RuGGby

  module Packet

    module Incoming

      # Packet containing and incoming message
      # Message packet contains not formatted data (not parsed, etc) so
      class Message < RuGGby::Packet::Incoming::Base

        TYPE    = 0x002e
        PATTERN = 'LLLLa*'

        attr_reader :uin, :message, :data, :created_at

        def initialize(data)
          super
          @uin        = @data[0]
          @created_at = @data[2]
          @message    = @data[4]
        end

        private

        def pattern
          PATTERN
        end

      end

    end

  end

end
