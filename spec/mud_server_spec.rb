require 'spec_helper'

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
  end

end