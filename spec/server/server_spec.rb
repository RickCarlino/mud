require 'spec_helper'

describe Server do

  before(:each) do
    @server = Server.new
  end

  after(:each) do
    # If you don't do this, you will get a port unavailable error. This should
    # never be needed in production because you only have one server, 
    @server.kill
  end

  describe '#new' do

    it 'initializes a server' do
     expect(@server).to be
    end

    it 'creates a connection list' do
      expect(@server.connections).to eq([])
    end

    it 'has a connection acceptor thread' do
      expect(@server.connection_acceptor).to be_an_instance_of Thread
    end
  end

end