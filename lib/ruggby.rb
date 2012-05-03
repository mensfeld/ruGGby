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

$:.unshift File.dirname(__FILE__)

module RuGGby

  autoload :Version, 'ruggby/version'

  module Packet
    # Factory used to build incoming packets out of raw socket messages
    autoload :Factory, 'ruggby/packet/factory'

    # Incoming packets used to wrap the raw socket messages send by GG server
    module Incoming
      path = 'ruggby/packet/incoming'
      autoload :Base,        "#{path}/base"
      autoload :LoginStatus, "#{path}/login_status"
      autoload :Message,     "#{path}/message"
      autoload :Welcome,     "#{path}/welcome"
    end

    # Outgoing packets send to GG server
    module Outgoing
      path = 'ruggby/packet/outgoing'
      autoload :Base,         "#{path}/base"
      autoload :Login,        "#{path}/login"
      autoload :Mark,         "#{path}/mark"
      autoload :Message,      "#{path}/message"
      autoload :Ping,         "#{path}/ping"
      autoload :ChangeStatus, "#{path}/change_status"
    end
  end

  # Available actions (we can hookup to all of them)
  module Action
    path = 'ruggby/action'
    autoload :Base,          "#{path}/base"
    autoload :CreateMessage, "#{path}/create_message"
    autoload :Login,         "#{path}/login"
    autoload :Mark,          "#{path}/mark"
    autoload :NewMessage,    "#{path}/new_message"
    autoload :Ping,          "#{path}/ping"
    autoload :Read,          "#{path}/read"
    autoload :ChangeStatus,  "#{path}/change_status"
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
