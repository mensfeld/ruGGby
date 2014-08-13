module RuGGby
  module Packet
    module Outgoing
      # Base class for all the outgoing messages
      # Contains all the methods needed to prepare the data to be send via
      # TCPSocket
      class Base
        class << self
          attr_reader :send_only_header

          @send_only_header = false

          # Tell us that, the package will be send without body
          def only_header
            @send_only_header = true
          end
        end

        class NotImplemented < StandardError; end

        def initialize(params = {})
          params.each do |key, value|
            send(:"#{key}=", value)
          end
        end

        # Pack data set according to given pattern
        def pack
          if self.class.send_only_header
            rawbody = [].pack('')
          else
            rawbody = body.pack(pattern)
          end

          [type, rawbody.length].pack('LL') + rawbody
        end

        private

        # Body array
        def body
          fail NotImplemented
        end

        # Packet type
        def type
          fail NotImplemented
        end

        # Pack pattern
        def pattern
          fail NotImplemented
        end
      end
    end
  end
end
