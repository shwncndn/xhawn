defmodule Xhawn.Consumer.VoiceStateUpdate do

  @my_id 1061145221452267631
  @channel_id 1273383115070636086
  @audio_file_path "/priv/audio/greek.m4a"


    # first check if member matches the user_id
    # second check if they've joined a specific channel

  def handle(%Nostrum.Struct.Event.VoiceState{} = voice_state) do
    dbg()
    case voice_state do
      %{user_id: @my_id, channel_id: @channel_id} ->
        play_audio(@audio_file_path)
      _ ->
        :ignore
    end
  end

  defp play_audio(file_path) do
    System.cmd("ffplay", ["-nodisp", "-autoexit", file_path])
  end

end



# my user id: 1061145221452267631



# msg: %Nostrum.Struct.Message{
#   activity: nil,
#   application: nil,
#   application_id: nil,
#   attachments: [],
#   author: %Nostrum.Struct.User{
#     id: 1061145221452267631,
#     username: "shwn.cndn",
#     discriminator: "0",
#     global_name: "Shawn",
#     avatar: "9ae0d50bc0282d732c88fc3dc230496b",
#     bot: nil,
#     public_flags: 0
#   },
#   channel_id: 1273383115070636085,
#   content: "<@1273365431352033292> !ping",
#   components: [],
#   edited_timestamp: nil,
#   embeds: [],
#   id: 1273709768925515816,
#   interaction: nil,
#   guild_id: 1273383115070636082,
#   member: %Nostrum.Struct.Guild.Member{
#     avatar: nil,
#     communication_disabled_until: nil,
#     deaf: false,
#     flags: 0,
#     joined_at: 1723668592,
#     mute: false,
#     nick: nil,
#     pending: false,
#     premium_since: nil,
#     roles: [],
#     user_id: nil
#   },
#   mention_everyone: false,
#   mention_roles: [],
#   mention_channels: nil,
#   mentions: [
#     %Nostrum.Struct.User{
#       id: 1273365431352033292,
#       username: "Xhawn",
#       discriminator: "1518",
#       global_name: nil,
#       avatar: nil,
#       bot: true,
#       public_flags: 0
#     }
#   ],
#   message_reference: nil,
#   nonce: 1273709767893712896,
#   pinned: false,
#   poll: nil,
#   reactions: nil,
#   referenced_message: nil,
#   sticker_items: nil,
#   timestamp: ~U[2024-08-15 18:27:53.295000Z],
#   thread: nil,
#   tts: false,
#   type: 0,
#   webhook_id: nil
# }
# ]
