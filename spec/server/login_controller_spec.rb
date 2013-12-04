require 'spec_helper'

describe LoginController do

  before(:each) do
    @server     = Server.new
    @player     = TCPSocket.new 'localhost', @server.port
    sleep 0.5 # TODO: Fix the race condition here. ^
    @controller = @server.connections.first.controller
  end

  after(:each) do
    @server.kill
  end

  describe '#on_create' do
    it 'sends a welcome message on connection' do
      expect(@player.gets.chomp).to eq('WELCOME! Type "login <name> <password>" to login or "quit" to exit')
    end
  end

  describe '#allowed_methods' do
    it 'allows only login and quit' do
      expect(@controller.allowed_methods).to eq(['quit', 'login'])
    end
  end

  describe '#login' do
    it 'denies incorrect logins'
    it 'logs user incorrect'
    it 'transitions to GameMainController'
  end

end