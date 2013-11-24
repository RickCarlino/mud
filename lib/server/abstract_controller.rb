#All controllers should inherit from here
class AbstractController

  attr_accessor :session

  def initialize(session)
    @session = session
    on_create
  end

  def on_create
  end

  def get_text(command)
    parse_command command
  end

  def send_text(command)
    @session.connection.puts(command)
  end

  def parse_command(command)
    command = command.split(' ')
    head    = command.shift
    tail    = command
    interpret_command head.to_s.downcase, tail
  end

  def interpret_command(head, tail)
    # Ruby continues to amaze me.
    if allowed_methods.include? head
      # TODO: Implement a second if condition- allow the user to type a quit command
      # from anywhere in the Mud.
      self.send(head, *tail)
    else

      send_text funny_responses.sample
    end
  end

  def funny_responses
    [
      'Huh?',
      "What's that you say?",
      'come again?',
      "Sorry, I don't know that command."
    ]
  end

  def allowed_methods
    []
  end

end