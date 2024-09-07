defmodule Xhawn.Supervisor do
  use Supervisor

  @moduledoc """
  when start_link/1 is called, the init/1 callback fires and the children of the Supervisor are initiated.
  """

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [Xhawn.Consumer]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
