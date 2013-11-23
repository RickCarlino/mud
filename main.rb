require 'socket'
require 'pry'

require_relative 'models/session'
require_relative 'models/server'

$server = Server.new

binding.pry