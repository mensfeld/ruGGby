module RuGGby

  module Packet

    module Incoming

      # Base class for all the incoming packets
      # Unpacks the data accorging to the pattern method
      class Base

        class NotImplemented < Exception;
        end

        attr_reader :data

        def initialize(data)
          @data = data.unpack(pattern)
        end

        private

        def pattern
          raise NotImplemented
        end

      end

    end

  end

end
