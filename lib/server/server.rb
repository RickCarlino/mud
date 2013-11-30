#The server class creates a single instance of a mud server.
class Server

  attr_accessor :connections, :tcp_socket
  attr_reader :connection_acceptor, :port, :ip

  def initialize(ip = "0.0.0.0", port = 4000)
    @port = port
    @ip   = ip
    @tcp_socket = TCPServer.new @ip , @port
    @connections = []

    Thread.new do
      while connection = @tcp_socket.accept
        @connections << Session.new(connection)
      end
    end
  end

  # You probably won't need this one in production, but it's a must for testing.
  def kill
    @tcp_socket.close
    @connection_acceptor.kill
    @connection_acceptor = nil
  end

end