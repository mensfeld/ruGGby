module RuGGby

  module Packet

    module Outgoing

      # Out going message class
      # When we want to send a message to a GG user, we need to provide
      # a GG number an a message
      class Message < RuGGby::Packet::Outgoing::Base

        TYPE = 0x0b
        PATTERN = 'LLLa*C'

        attr_accessor :message, :uin

        # uin => GG nr
        # msg => message we want to send
        def initialize(uin, msg)
          # Type uin (gg number) to integer, just to be sure
          @uin = uin.to_i
          # Convert incoming message into ISO-8859-2 just to be sure that
          # polish letters will be sent properly
          @message = StringEncoder.to_output(msg)
        end

        private

        def body
          [@uin, rand(2**32), 0x08, @message, 0]
        end

        def pattern
          PATTERN
        end

        def type
          TYPE
        end

      end

    end

  end

end
