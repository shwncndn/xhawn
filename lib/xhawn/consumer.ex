defmodule Xhawn.Consumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case msg.content do
      "!sleep" ->
        Api.create_message(msg.channel_id, "Going to sleep...")

        Process.sleep(3000)

      "!ping" ->
        Api.create_message(msg.channel_id, "pyongyang!")

      "!raise" ->

        raise "No problems here!"

      _ ->
        :ignore
    end
  end
end
