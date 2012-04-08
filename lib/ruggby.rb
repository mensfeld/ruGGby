# RuGGby is a simple (not completed) implementation of a GG  written in Ruby
# It allows us to login to our account and receive/send messages

# Currently due to lack of time this are the only actions that are available

# Usage example:

# gg = RuGGby::Client.new
#
# gg.on_new_message do |uid, message|
#   gg.message(uid, message)
# end
#
# gg.login!(gg_nr, Pass)
# gg.wait
# gg.logout!

module RuGGby

  autoload :Version, 'ruggby/version.rb'

  module Packet
    # Factory used to build incoming packets out of raw socket messages
    autoload :Factory, 'ruggby/packet/factory.rb'

    # Incoming packets used to wrap the raw socket messages send by GG server
    module Incoming
      path = 'ruggby/packet/incoming'
      autoload :Base,        "#{path}/base.rb"
      autoload :LoginStatus, "#{path}/login_status.rb"
      autoload :Message,     "#{path}/message.rb"
      autoload :Welcome,     "#{path}/welcome.rb"
    end

    # Outgoing packets send to GG server
    module Outgoing
      path = 'ruggby/packet/outgoing'
      autoload :Base,         "#{path}/base.rb"
      autoload :Login,        "#{path}/login.rb"
      autoload :Mark,         "#{path}/mark.rb"
      autoload :Message,      "#{path}/message.rb"
      autoload :Ping,         "#{path}/ping.rb"
      autoload :ChangeStatus, "#{path}/change_status.rb"
    end
  end

  # Available actions (we can hookup to all of them)
  module Action
    path = 'ruggby/action'
    autoload :Base,          "#{path}/base.rb"
    autoload :CreateMessage, "#{path}/create_message.rb"
    autoload :Login,         "#{path}/login.rb"
    autoload :Mark,          "#{path}/mark.rb"
    autoload :NewMessage,    "#{path}/new_message.rb"
    autoload :Ping,          "#{path}/ping.rb"
    autoload :Read,          "#{path}/read.rb"
    autoload :ChangeStatus,  "#{path}/change_status.rb"
  end

  # Other stuff that is needed
  autoload :Socket,        'ruggby/socket'
  autoload :Logger,        'ruggby/logger'
  autoload :Callback,      'ruggby/callback'
  autoload :Converter,     'ruggby/converter'
  autoload :Password,      'ruggby/password'
  autoload :Threader,      'ruggby/threader'
  autoload :StringEncoder, 'ruggby/string_encoder'
  autoload :Client,        'ruggby/client'

end
