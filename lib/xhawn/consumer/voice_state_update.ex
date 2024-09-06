defmodule Xhawn.Consumer.VoiceStateUpdate do
  @my_id 1_061_145_221_452_267_631
  @cahlin_id 1_259_997_325_502_320_760
  @bill_id 654_846_973_509_369_856
  @manny_id 994_420_818_958_352_444
  @voice_channel_id 1_273_383_115_070_636_086

  @greece_audio_file_path Path.join(:code.priv_dir(:xhawn), "audio/greek.m4a")
  @japan_audio_file_path Path.join(:code.priv_dir(:xhawn), "audio/japan.m4a")

  def handle(%Nostrum.Struct.Event.VoiceState{} = voice_state) do
    case {voice_state.user_id, voice_state.channel_id} do
      {@cahlin_id, @voice_channel_id} ->
        play_audio(@greece_audio_file_path)

      {@bill_id, @voice_channel_id} ->
        play_audio(@japan_audio_file_path)

      {@manny_id, @voice_channel_id} ->
        play_audio(@japan_audio_file_path)

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
