defmodule Xhawn.MixProject do
  use Mix.Project

  def project do
    [
      app: :xhawn,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      name: "xhawn_bot",
      package: package(),
      source_url: "https://github.com/shwncndn/xhawn_bot"
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
      {:req, "~> 0.5.6"},
      {:ex_doc, "~> 0.34.2"}
    ]
  end

  defp description() do
    "Xhawn is a Discord voice and text channel bot that fetches memes from Reddit when prompted and plays your theme song when you entering voice channel - so everyone knows what the score is.."
  end

  defp package() do
    [
      name: "xhawn_bot",
      files: ~w(lib priv .formatter.exs mix.exs README.md),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/shwncndn/xhawn_bot"}
    ]
  end
end
