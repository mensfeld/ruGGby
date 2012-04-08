module RuGGby

  module Packet

    module Outgoing

      # Packet send when we want to login into our GG account
      # There is a lot of data that needs to be send here, but basically
      # We need to provide:
      # => :uin  - gg number
      # => :hash - hashed password
      # We can also provide a gg status:
      # => :status
      class Login < RuGGby::Packet::Outgoing::Base

        TYPE       = 0x0031
        PATTERN    = 'La2Ca64LLLLSLSCCLa35L'
        GG_VERSION = 'Gadu-Gadu Client build 10.0.0.10450'

        attr_accessor :uin, :hash, :status, :description

        def initialize(params = {})
          super
          @description = params[:description] || ''

          if @description.length > 0
            @status = RuGGby::Converter.status_description(@status)
          else
            @status = RuGGby::Converter.status(@status)
          end
        end

        private

        def body
          [
           @uin.to_i,           # L
           'pl',                # a2
           0x02,                # C
           @hash,               # a64
           @status,             # L
           0,                   # L
           0x00000007,          # L
           0,                   # L
           0,                   # S
           0,                   # L
           0,                   # S
           64,                  # C
           0x64,                # C
           GG_VERSION.length,   # L
           GG_VERSION,          #a35
           @description.length, #L,
           @description         # Nothing?
          ]
        end

        def type
          TYPE
        end

        def pattern
          if @description.length > 0
            PATTERN+"a#{@description.length}"
          else
            PATTERN
          end
        end

      end

    end

  end

end
