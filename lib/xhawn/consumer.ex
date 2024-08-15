defmodule Xhawn.Consumer do
  use Nostrum.Consumer

  alias Xhawn.Consumer.{
      MessageCreate,
      FetchMeme
  }

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    MessageCreate.handle(msg)
  end


  def handle_event({:FETCH_MEME, meme, _ws_state}) do
    FetchMeme.handle(meme)
  end


  def handle_event(_event) do
    :noop
  end

end
