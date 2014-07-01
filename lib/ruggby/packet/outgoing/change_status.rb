module RuGGby

  module Packet

    module Outgoing

      # Packet send when we want to change status
      # Params:
      # => new_status
      # => description
      class ChangeStatus < RuGGby::Packet::Outgoing::Base

        TYPE = 0x0038
        PATTERN = 'LLL'

        attr_accessor :status, :description

        def initialize(status, description)
          @description = description || ''

          if @description.length > 0
            @status = RuGGby::Converter.status_description(status)
          else
            @status = RuGGby::Converter.status(status)
          end
        end

        private

        def body
          [
              @status, # L
              0, # L
              @description.length, # L
              @description # a
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
