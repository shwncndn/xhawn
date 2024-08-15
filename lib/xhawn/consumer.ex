defmodule Xhawn.Consumer do

  @moduledoc """
  Consumer module

  Each handle_event/1 function pattern matches on the first argument in the head to trigger the correct event handler.
  The second argument is the relevant Norstrum.Struct.
  Third argument is -

  The body of each handle_event/1 function triggers a handle/1 function which lives in its corresponding Xhawn.Consumer file.
  Each handle/1 function pattern matches on the relevant struct. Example, :MESSAGE_CREATE %Nostrum.Struct.Message{} = msg
  """
  use Nostrum.Consumer

  alias Xhawn.Consumer.{
    MessageCreate,
    VoiceStateUpdate
  }




  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    MessageCreate.handle(msg)
  end

  def handle_event({:VOICE_STATE_UPDATE, update, _ws_state}) do
    VoiceStateUpdate.handle(update)
  end

  def handle_event(_event) do
    :noop
  end
end
