defmodule Xhawn.MixProject do
  use Mix.Project

  def project do
    [
      app: :xhawn,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Xhawn.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nostrum, "~> 0.10.0"},
      {:jason, "~> 1.4"},
      {:req, "~> 0.5.6"}
    ]
  end
end
