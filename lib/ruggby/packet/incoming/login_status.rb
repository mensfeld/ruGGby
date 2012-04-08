module RuGGby

  module Packet

    module Incoming

      # Message telling as whether or not the loginj process was successfull
      # It is a bit different from others because it gets one parameter on which
      # we assume that the login was successful or unsuccessful
      class LoginStatus

        TYPE = 0x00035

        def initialize(valid)
          @valid = valid
        end

        def successful?
          @valid
        end

      end

    end

  end

end
