# Xhawn

[![Hex.pm](https://img.shields.io/hexpm/v/xhawn_bot.svg)](https://hex.pm/packages/xhawn_bot)
[![Docs](https://img.shields.io/badge/hex-docs-blue.svg)](https://hexdocs.pm/xhawn_bot/0.1.0/api-reference.html)

## Voice Channel Music and Memes at the Speed of Memes

Xhawn is a Discord voice and text channel bot that fetches memes from Reddit when prompted and plays your theme song when you enter a voice channel - so everyone knows what the score is.

## Key Features

- Command handling for text messages
- Voice channel interaction and audio playback
- Integration with an external meme API
- Containerized deployment using Docker

### Overview

The main entry point is `Xhawn.Consumer`, which connects to Discord and listens for events:

- Message handling via `Xhawn.Consumer.MessageUpdate`
- Voice state updates via `Xhawn.Consumer.VoiceStateUpdate`

Incoming events are handled via pattern matching on `handle_event/1`:

```elixir
def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
  MessageCreate.handle(msg)
end

def handle_event({:VOICE_STATE_UPDATE, update, _ws_state}) do
  VoiceStateUpdate.handle(update)
end
```

`Xhawn.Consumer` is the only consumer required in the Supervision tree as each event has its own process.

From the Nostrum docs:
> By default, nostrum will start a process for each event. This gives us free parallelism and isolation. You therefore do not need to start more than one consumer in your supervision tree.

Starting multiple consumers could lead to several issues such as redudancy (since each process of each consumer is receiving every every event) and compounding API requests, leading to increased resource usage and performance bottlenecks.
