class MudServer::Session

  attr_accessor :connection, :ip_addr, :input_thread, :controller

  def initialize(connection, controller, wait = false)
    bootstrap_settings(connection, controller)
    start unless wait
  end

  def bootstrap_settings(connection, controller)
    @connection   = connection
    @ip_addr      = @connection.peeraddr[-1]
    @controller   = controller.new(self)
  end

  def start
    @input_thread = Thread.new(@connection) do |client|
      while (client_input = client.gets.chomp)
        @controller.get_text client_input
      end
    end
  end

end
