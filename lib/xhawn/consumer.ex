defmodule Xhawn.Consumer do
  @moduledoc """
  # Consumer Module

  This module handles various events from Discord using pattern matching and
  event-specific handlers.

  ## Event Handling

  Each `handle_event/1` function follows this pattern:

     The function head pattern matches on the first argument
     to trigger the correct event handler.

     The second argument contains the relevant `Nostrum.Struct`.

     The third argument represents the WebSocket state.

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

  use Nostrum.Consumer

  alias Xhawn.Consumer.{
    MessageCreate,
    VoiceStateUpdate
  }

  @doc """
  Handles the MESSAGE_CREATE event.

  Called when a new message is created - bot must have access to channel.

  ## Parameters

  - `msg`: A `Nostrum.Struct.Message` struct containing info about the created message.
  - `_state`: The current WebSocket state.

  ## Returns

  The return value of `MessageCreate.handle(msg)`.
  """
  def handle_event({:MESSAGE_CREATE, msg, _state}) do
    MessageCreate.handle(msg)
  end

  @doc """
  Handles the VOICE_STATE_UPDATE event.

  This function is called when a user's voice state changes (e.g., joining/leaving a voice channel, muting/unmuting).

  ## Parameters

  - `update`: A `Nostrum.Struct.VoiceState` struct containing information about the updated voice state.
  - `_state`: The current WebSocket state.

  ## Returns

  Return value of `VoiceStateUpdate.handle(update)`.
  """
  def handle_event({:VOICE_STATE_UPDATE, update, _state}) do
    VoiceStateUpdate.handle(update)
  end

  @doc """
  Handles any unmatched events.

  This function is called for any event that doesn't match the other `handle_event/1` functions.

  ## Parameters

  `_event`: The unmatched event data.

  ## Return

  `:noop` (no operation).
  """
  def handle_event(_event) do
    :noop
  end
end
