module RuGGby
  module Action
    # Base class for all the event actions
    class Base
      def initialize(client)
        @block = client.actions[:base]
      end
    end
  end
end
