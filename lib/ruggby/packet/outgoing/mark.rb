module RuGGby

  module Packet

    module Outgoing

      # Mark instance needs to be send to GG if we don't have (and don't want)
      # any user list - if we don't send this after valid loggin process
      # the GG will not communicate with us
      class Mark < RuGGby::Packet::Outgoing::Base

        TYPE = 0x12

        only_header

        private

        def type
          TYPE
        end

      end

    end

  end

end
