#The server class creates a single instance of a mud server.
class Server

  attr_accessor :connections, :tcp_socket

  def initialize(ip = "0.0.0.0", port = 23)
    @tcp_socket = TCPServer.new ip , port

    @connections = []

    Thread.new do
      while connection = @tcp_socket.accept
        @connections << Session.new(connection)
      end
    end
  end
end