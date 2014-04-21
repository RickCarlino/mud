require 'spec_helper'
require 'socket'
describe MudServer do

  let(:server){ MudServer.new }

  describe '#new' do
    it 'instantiates a server with defaults' do
      expect(server).to be_kind_of(MudServer)
      expect(server.port).to eq(4000)
      expect(server.ip).to eq('0.0.0.0')
      expect(server.environment).to eq('development')
      expect(server.connection_pool).to eq([])
    end
  end

  describe '#start' do
    it 'sets the world in motion' do
      mud = server
      expect(mud.start).to be_true
      expect(mud.tcp_socket).to be_kind_of(TCPServer)
      expect(mud.stop).to be_true # Prevents reference leaks.
    end

    it 'accepts incoming connections' do
      mud = server
      server.start
      socket = TCPSocket.new server.ip, server.port
      message = socket.gets.chomp
      socket.puts 'quit'
      socket.close
      server.stop

      expect(message).to eq('It works! Type `quit` to end')
    end
  end

end