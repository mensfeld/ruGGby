# ruGGby - Gadu Gadu protocol client implementation in pure Ruby language

## Install

```ruby
gem install ruggby
```

and in your Gemfile:

```ruby
gem 'ruggby'
```

## About

ruGGby is a Gadu-Gadu (Polish messenger similar to ICQ) protocol client, which allows you to:

* Login to your Gadu-Gadu account
* Set and change status and description
* Receive messages
* Send messages
* Perform callbacks on almost every event connected to GG handling
* Works with big GG numbers
* Works with polish letters and other UTF-8 characters

## Usage

Let's start with a simple example:

### Simple example
```ruby
gg = RuGGby::Client.new

gg.login!(LOGIN, PASSWORD)
gg.message(RECEIVER_GG, 'this is a message')
gg.logout!
```

So, what have we done? We've created an Gadu-Gadu instance client, logged in, sent a message and logged out. Easy enough ;)

### Login in and login out

Log in/out process is fairly simple:

```ruby
gg = RuGGby::Client.new

gg.login!(LOGIN, PASSWORD)
gg.logout!
```

We can also pass two additional parameters to *login!* method:

* :status - initial GG status
* :description - initial GG description

So the "full" login would look like:

```ruby
gg = RuGGby::Client.new

gg.login!(LOGIN, PASSWORD, :status => :busy, :description => '2Busy')
```

### Updating status and description

Sometimes we want to update our status. In order to do so, invoke a *change_status* method with two parameters:

* status - status symbol
* description (optional) - optional description for status

The allowed statuses are:

* :available
* :busy
* :invisible

```ruby
gg.change_status(:busy, 'I\'m so busy right now!')
```

### Keeping ruGGby bot alive

To keep the bot working, just invoke the *wait* method and it will exit:

```ruby
gg = RuGGby::Client.new

gg.on_new_message do |uid, time, message|
  gg.message(uid, message)
end

gg.login!(LOGIN, PASSWORD)
gg.wait
```

### Logger

By default RuGGby uses a *RuGGby::Logger* logger, which only prints output to console. However, you can replace it with any logger that support following methods:

* *debug*(message)
* *info*(message)
* *error*(message)
* *fatal*(message)

To do so, create an *RuGGby::Client* instance and assign your own logger:

```ruby
require 'logger'

gg = RuGGby::Client.new
gg.logger = Logger.new('gg.log', :weekly)
```

In order to change log level, just assing a new one like this:

```ruby
RuGGby::Client.log_level = :error
```

### Events

RuGGby supports events, so you can assign your own events on demand. Events list:

* :read - event triggered on each read from RuGGby::Socket
* :ping - event triggered on each GG Server Ping
* :new_message - event triggered on new message receive
* :mark - event triggered when we send mark packet to GG Server
* :login - event triggered after login
* :create_message - event triggered after message has been send
* :change_status - event triggered after our status/description change
* :status_changed - event triggered after someone on buddy list change status

Each event block is triggered with parameters:

* :read(packet) - *RuGGby::Packet* instance (build using *RuGGby::Packet::Factory*)
* :ping - no parameters
* :new_message(uin, timestamp, message)
* :mark - no parameters
* :login - no parameters
* :create_message(uin, message)
* :change_status(status, description)
* :check_uin_status(uin)

In order to assign an action to an event, pass a block into events hash:

```ruby
gg = RuGGby::Client.new

gg.actions[:new_message] = proc do |uin, created_at, msg|
  # uin is a sender GG number (Integer)
  # created_at - Time.at when message has been sent
  # msg - String containing message
  print "#{uin}-#{created_at}: #{msg}\n"
end
```

However most of the events don't need an action so you can use *on_new_message* method to assign a block:

```ruby
gg = RuGGby::Client.new

gg.on_new_message do |uid, time, message|
  gg.message(uid, message)
end
```

The *:new_message* event is triggered in a separate thread so the socket read process is still going. The above code will (after login!) return a message to it's sender.

To add a friend to a buddy list to listening his status you can:

```ruby
gg.check_uin_status(uin) # to listen buddy initial status, move this line after 'on_status_changed'

gg.on_status_changed do |uin,status|
  print "Friend #{uin} changed status to #{status}"
end

```

## TODO

* Tests (currently there is no :()
* More sophisticated GG actions (friends, etc)

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with Rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Maciej Mensfeld. See LICENSE for details.

Based on http://toxygen.net/libgadu/protocol
