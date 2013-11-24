require 'socket'
require 'pry'

require_relative 'server/abstract_controller'
require_relative 'server/login_controller'
require_relative 'server/session'
require_relative 'server/server'

$server = Server.new

binding.pry