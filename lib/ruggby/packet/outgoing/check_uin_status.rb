module RuGGby
  module Packet
    module Outgoing
      # Out going check uin status class
      # When we want to check if someone is available or not we need to provide
      # a GG number
      class CheckUinStatus < RuGGby::Packet::Outgoing::Base
        TYPE = 0x000d
        PATTERN = 'LC'

        attr_accessor :uin

        # uin => GG nr
        def initialize(uin)
          # Type uin (gg number) to integer, just to be sure
          @uin = uin.to_i
        end

        private

        def body
          [@uin, 0x03]
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
