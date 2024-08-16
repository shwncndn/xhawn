defmodule Xhawn.Consumer.VoiceStateUpdate do
  @my_id 1061145221452267631
  @channel_id 1273383115070636086
  @greece_audio_file_path Path.join(:code.priv_dir(:xhawn), "audio/greek.m4a")
  @japan_audio_file_path  Path.join(:code.priv_dir(:xhawn), "audio/japan.m4a")
  @ventura_audio_file_path  Path.join(:code.priv_dir(:xhawn), "audio/ventura.m4a")

  def handle(%Nostrum.Struct.Event.VoiceState{} = voice_state) do
    dbg()
    case {voice_state.user_id, voice_state.channel_id} do
      {@my_id, @channel_id} ->
        if voice_state.channel_id == @channel_id do
          play_audio(@audio_file_path)
        end
      _ ->
        :ignore
    end
  end


  defp play_audio(file_path) do
    System.cmd("ffplay", ["-nodisp", "-autoexit", file_path])
  end
end
