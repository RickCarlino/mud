require 'socket'
require 'pry'

require_relative 'server/session'
require_relative 'server/server'

$server = Server.new

binding.pry