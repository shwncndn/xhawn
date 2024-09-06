# Xhawn

hex.pm docs: https://hexdocs.pm/xhawn_bot/0.1.0/api-reference.html

## Voice channel intro songs and memes at the speed of memes.

Xhawn is a Discord voice and text channel bot that fetches memes from Reddit when prompted and plays your theme song when you entering voice channel - so everyone knows what the score is..

Main entry point is `Xhawn.Consumer` - connects to Discord and listens for events:


def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
  MessageCreate.handle(msg)
end

def handle_event({:VOICE_STATE_UPDATE, update, _ws_state}) do
  VoiceStateUpdate.handle(update)
end

Incoming events match on `:MESSAGE_CREATE` or `:VOICE_STATE_UPDATE`, depending on if
