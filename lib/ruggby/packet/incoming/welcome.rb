module RuGGby

  module Packet

    module Incoming

      # Welcome packet - sent by GG when we connect to their socket
      # Contains a seed used to mix with password before authorization
      class Welcome < RuGGby::Packet::Incoming::Base

        TYPE = 0x0001
        PATTERN = 'I'

        attr_reader :seed

        def initialize(data)
          super
          @seed = @data[0]
        end

        private

        def pattern
          PATTERN
        end

      end

    end

  end

end
