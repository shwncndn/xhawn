defmodule Xhawn.Consumer do
  @moduledoc """
  # Consumer Module

  This module handles various events from Discord using pattern matching and
  event-specific handlers.

  ## Event Handling

  Each `handle_event/1` function follows this pattern:

  1. **Pattern Matching**: The function head pattern matches on the first argument
     to trigger the correct event handler.

  2. **Event Data**: The second argument contains the relevant `Nostrum.Struct`.

  3. **WebSocket State**: The third argument represents the WebSocket state.

  The body of each `handle_event/1` function triggers`handle/1`
  function in `Xhawn.Consumer`.

  ## Struct Match at Entry Point

  Each `handle/1` function pattern matches on the relevant struct.

  ### Example

  For a message creation event:

  ```elixir
  def handle_event({:MESSAGE_CREATE, %Nostrum.Struct.Message{} = msg, _ws_state}) do
    MessageCreate.handle(msg)
  end
  ```
  """

  def handle_event({:MESSAGE_CREATE, %Nostrum.Struct.Message{} = msg, _ws_state}) do
    MessageCreate.handle(msg)
  end

  use Nostrum.Consumer

  alias Xhawn.Consumer.{
    MessageCreate,
    VoiceStateUpdate
  }

  def handle_event({:MESSAGE_CREATE, msg, _state}) do
    MessageCreate.handle(msg)
  end

  def handle_event({:VOICE_STATE_UPDATE, update, _state}) do
    VoiceStateUpdate.handle(update)
  end

  def handle_event(_event) do
    :noop
  end
end
