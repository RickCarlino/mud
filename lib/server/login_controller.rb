class LoginController < AbstractController

  def on_create
    send_text 'WELCOME! Type "login <name> <password>" to login or "quit" to exit'
  end

  def allowed_methods
    super + ['login']
  end

  # The user authentication action. First command argument is the username.
  # Second command argument is the password. All other arguments are ignored
  def login(*args)
    send_text "You entered #{args[0]} and #{args[1]}"
    send_text 'This is just a stub at this point, though'
    send_text 'You have seen just about everything. I suggest typing "quit"'
  end



end