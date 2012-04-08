module RuGGby

  # Defines methods that we can use to define an actions to events
  module Callback

    # What should we do when we receive a new message
    # You'll get passed 3 parameters to a block:
    # uin        => user GG number
    # created_at => Time.at when message was sent
    # message    => String containing a received message
    def on_new_message(&block)
      self.actions[:new_message] = block
    end

    # Method invoked when we change our status or description on GG
    def on_change_status(&block)
      self.actions[:change_status] = block
    end

  end

end
