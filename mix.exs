defmodule Hexen.Mixfile do
  use Mix.Project

  def project do
    [app: :hexen,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {Hexen.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo, "~> 0.6.1", only: [:dev, :test]},
      {:dialyxir, "~> 0.5.0", only: [:dev], runtime: false},
      {:gen_stage, "~> 0.11.0"},
      {:flow, "~> 0.11.0"},
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.1"}
    ]
  end
end
