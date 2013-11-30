require_relative 'loader'

$server = Server.new
puts "press enter to exit. Server is now running on port 4000."
gets.chomp

puts 'Goodbye!'