# Ruby Mud

@M3talsmith made mention that he liked MUDs. Here's a mud I made. It's been recently cleaned up for use by others.

It's got:

 - Sockets
 - Threads
 - ?????
 - 0 external runtime dependencies (pure Ruby, yo.)

# Installation

 - `gem install ruby-mud`
 - `require 'ruby_mud'`


# Word of Caution

**Telnet is insecure by default**. All network traffic to the game is sent in the clear. Advise users against using real passwords when running this codebase. This ain't SSH!

# Quick Tutorial

```ruby
require 'ruby_mud'

# Controllers define the action for a menu / sub-game. Eg: Login screen, 
# main game, map screen, etc.. By default, the server will start new connections
# in MudServer::DefaultController.
class MudServer::DefaultController

  # on_start will always be called when the user enters a controller.
  # You don't need to use it, but it's there.
  def on_start
    # Send messages via send_text.
    send_text "Welcome! Here's a list of available commands"
    send_text "TIME  : See the current time."
    send_text "SAY   : Talk."
    send_text "SECRET: Go somewhere super secret."
    send_text "QUIT  : Disconnect from the server."
  end

  # For security, you must explicitly whitelist any commands that you want to
  # give players access to. Otherwise they will not be accessible by users.
  def allowed_methods
    super + ['time', 'secret', 'say'] # Quit is available by default via `super`
                                      # No need to implement it yourself.
  end

  # User input after a command is provided via `params`.
  def say
   send_text "You just said: #{params}"
  end

  def time
    send_text "The time is now #{Time.now}"
  end

  #Transfer people to a different menu / area using `transfer_to`
  def secret
    transfer_to PokerRoom # Define the PokerRoom as a controller.
  end

end

# An example of another controller / sub-game / menu.
class PokerRoom < MudServer::AbstractController # controllers are inherited.
  def on_start
    send_text 'You found the secret poker room!'
    send_text 'Type DEAL to get a hand of cards.'
  end

  def allowed_methods
    ['quit', 'deal']
  end

  def deal
    send_text 'Did I say poker? I meant dice.'
    send_text "You rolled a #{rand(5)+1}."
  end

end

server = MudServer.new '0.0.0.0', '4321' # Run server on all IPs on port 4321.
                                         # Defaults to 0.0.0.0:4000 if none set.
server.start # Accept connections

puts 'Press enter to exit.'

server.stop if gets.chomp
```
