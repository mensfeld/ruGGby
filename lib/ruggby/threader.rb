module RuGGby
  # Class used to ignite actions in threads
  class Threader
    # @param [RuGGby::Client] client
    # @param [RuGGby::Action] one of the RuGGby actions that we can perform
    # @return [Thread] newly created thread in which we execute given action
    # @example
    def self.run(client, element)
      thread = Thread.new do
        begin
          client.logger.debug("RuGGby::Threader run #{element.class}")
          element.run!
          client.logger.debug("RuGGby::Threader finish #{element.class}")
        rescue => e
          client.logger.fatal("RuGGby::Threader #{e}")
          raise e
        end
      end

      client.threads << thread

      thread
    end
  end
end
