module RuGGby

  # Class used to ignite actions in threads
  class Threader

    def self.run(client, element)
      client.threads << Thread.new do
        begin
          client.logger.debug("RuGGby::Threader run #{element.class}")
          element.run!
          client.logger.debug("RuGGby::Threader finish #{element.class}")
        rescue => e
          client.logger.fatal("RuGGby::Threader #{e}")
          raise e
        end
      end
    end

  end

end
