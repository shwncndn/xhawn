defmodule Xhawn.Consumer.MessageCreate do

  alias Nostrum.Api


  def handle(%Nostrum.Struct.Message{} = msg) do
    dbg()
    case msg.content do
      "!sleep" ->
        Api.create_message(msg.channel_id, "Going to sleep...")
        # This won't stop other events from being handled.
        Process.sleep(3000)

      "!ping" ->
        Api.create_message(msg.channel_id, "pyongyang!")

      "!raise" ->
        # This won't crash the entire Consumer.
        raise "No problems here!"

        "!meme" ->
          case get_random_meme() do
            {:ok, meme_url} ->
              Api.create_message(msg.channel_id, content: "Here's your meme Shawny!", embed: %{image: %{url: meme_url}})
            {:error, reason} ->
              Api.create_message(msg.channel_id, "Sorry, I couldn't fetch a meme: #{reason}")
          end

      _ ->
        :ignore
    end
  end


  # matching function heads with the params passed into an interpolated path in the Req request

  # defp get_meme do
  #   case Req.get("https://meme-api.com/gimme") do
  #     {:ok, %Req.Response{status: 200, body: body}} ->
  #       case body do
  #         %{"url" => url} -> {:ok, url}
  #       end
  #   end
  # end

  defp get_random_meme do
    case Req.get("https://meme-api.com/gimme") do
      {:ok, %Req.Response{status: 200, body: %{"url" => url}}} ->
        {:ok, url}

      {:ok, %Req.Response{status: 200}} ->
        {:error, "Failed to parse response"}

      {:ok, %Req.Response{}} ->
        {:error, "Unexpected response format"}

      {:error, reason} ->
        {:error, "HTTP request failed: #{inspect(reason)}"}

    end
  end

  end
