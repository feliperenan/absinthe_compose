defmodule AbsintheCompose.MixProject do
  use Mix.Project

  def project do
    [
      app: :absinthe_compose,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:absinthe, "~> 1.5"},
      {:httpoison, "~> 1.7"},
      # dev/test dependencies
      {:absinthe_plug, "~> 1.5", only: [:dev, :test]},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:jason, "~> 1.0", only: [:dev, :test]},
      {:plug_cowboy, "~> 2.0", only: [:dev, :test]}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Michael Ries"],
      licenses: ["MIT"],
      description: """
      An Absinthe extension for composing GraphQL endpoints together
      """,
      links: %{
        github: "https://github.com/SpiffInc/absinthe_compose"
      },
    ]
  end
end
