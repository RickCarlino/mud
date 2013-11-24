class Session

  attr_accessor :connection, :ip_addr, :input_thread, :controller

  def initialize(connection)

    @connection   = connection

    @ip_addr      = @connection.peeraddr[-1]

    @controller   = LoginController.new(self)

    @input_thread = Thread.new(@connection) do |client|
      while (client_input = client.gets.chomp)
        @controller.get_text client_input
      end
    end

  end

end
