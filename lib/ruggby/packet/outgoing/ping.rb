module RuGGby

  module Packet

    module Outgoing

      # Ping packet is used to upkeep the TCP connection with GG
      # Needs to be send every 3-5 minutes to tell GG that we are alive
      class Ping < RuGGby::Packet::Outgoing::Base

        TYPE = 0x08

        only_header

        private

        def type
          TYPE
        end

      end

    end

  end

end
