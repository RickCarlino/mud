#The server class creates a single instance of a mud server.
class MudServer

  attr_accessor :connection_pool, :tcp_socket,
                :connection_acceptor, :port, :ip, :environment

  def initialize(ip = "0.0.0.0", port = 4000, environment = 'development')
    bootstrap_settings(ip, port, environment)
  end

  def bootstrap_settings(ip, port, environment)
    @port            = port
    @ip              = ip
    @environment     = environment
    @connection_pool = [] # This is where we keep reference to all game
                          # connections
  end

  def start
    @tcp_socket = TCPServer.new @ip , @port
    @connection_acceptor = Thread.new do
      while connection = @tcp_socket.accept
        @connection_pool << MudServer::Session.new(connection)
      end
    end
    return true
  end

  # You probably won't need this one in production, but it's a must for testing.
  def stop
    @tcp_socket.close
    @connection_acceptor.kill
    @connection_acceptor = nil
    return true
  end

end