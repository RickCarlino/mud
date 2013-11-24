require 'socket'
require 'pry'

require_relative 'server/abstract_controller'
require_relative 'server/login_controller'
require_relative 'server/session'
require_relative 'server/server'

$server = Server.new

puts "Type 'quit' to exit. Server is now running on port 4000."

while gets.chomp != 'quit'
end

puts 'Goodbye!'