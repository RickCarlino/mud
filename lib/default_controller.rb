# This is a default implementation and entry point for all Mud activity.
# Override this controller in Your implementation. See AbstractController for
# better documentation.
class MudServer::DefaultController < MudServer::AbstractController
  def on_start
    send_text 'It works! Type `quit` to end'
  end
end