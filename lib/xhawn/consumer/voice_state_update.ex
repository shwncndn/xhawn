defmodule Xhawn.Consumer.VoiceStateUpdate do
  @my_id 1061145221452267631
  @cahlin_id 1259997325502320760
  @bill_id 654846973509369856
  @manny_id 994420818958352444
  @voice_channel_id 1273383115070636086

  @greece_audio_file_path Path.join(:code.priv_dir(:xhawn), "audio/greek.m4a")
  @japan_audio_file_path  Path.join(:code.priv_dir(:xhawn), "audio/japan.m4a")
  @ventura_audio_file_path  Path.join(:code.priv_dir(:xhawn), "audio/ventura.m4a")

  def handle(%Nostrum.Struct.Event.VoiceState{} = voice_state) do
    case {voice_state.user_id, voice_state.channel_id} do
      {@cahlin_id, @voice_channel_id} ->
        play_audio(@greece_audio_file_path)

      {@bill_id, @voice_channel_id} ->
        play_audio(@japan_audio_file_path)

      {@manny_id, @voice_channel_id} ->
        play_audio(@ventura_audio_file_path)

      {@my_id, @voice_channel_id} ->
        play_audio(@greece_audio_file_path)

      {_user_id, @voice_channel_id} ->
        IO.puts("Someone else joined the voice channel")

      {_user_id, nil} when voice_state.user_id in [@cahlin_id, @bill_id, @manny_id, @my_id] ->
        IO.puts("#{voice_state.user_id} left a voice channel")

      _ ->
        :ignore
    end
  end

  defp play_audio(file_path) do
    System.cmd("ffplay", ["-nodisp", "-autoexit", file_path])
  end
end
