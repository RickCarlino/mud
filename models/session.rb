class Session

  attr_accessor :connection, :ip_addr, :input

  def initialize(connection)

    @connection = connection

    @ip_addr = @connection.peeraddr[-1]

    @input_thread = Thread.new(@connection) do |client|
      while (client_input = client.gets.chomp)
        get_text client_input
      end
    end

  end

  def get_text(command)
    parse_command command
  end

  def send_text(command)
    @connection.puts(command)
  end

  def parse_command(command)
    command = command.split(' ')
    head    = command.shift
    tail    = command
    interpret_command head, tail
  end

  def interpret_command(head, tail)
  end

end
