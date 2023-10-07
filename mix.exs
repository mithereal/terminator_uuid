defmodule Terminator.UUID.MixProject do
  use Mix.Project

  @version "0.6.1"
  def project do
    [
      app: :terminator_uuid,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      description: description(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      package: package(),
      docs: docs(),
      dialyzer: dialyzer()
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Terminator.UUID.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.0"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, "~> 0.16"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:optimus, "~> 0.1.0", only: :dev},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:ex_machina, "~> 2.2", only: :test},
      {:excoveralls, "~> 0.10", only: :test},
      {:mock, "~> 0.3.0", only: :test},
      {:inch_ex, ">= 0.0.0", only: :docs},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp description() do
    "Elixir ACL library for managing user abilities and permissions with support of ecto(uuid) and compatibility with absinthe"
  end

  defp package() do
    [
      files: ~w(lib priv/repo/migrations .formatter.exs mix.exs README*),
      licenses: ["GPL-3.0-or-later"],
      links: %{"GitHub" => "https://github.com/data-twister/terminator_uuid"}
    ]
  end

  defp docs() do
    [
      extras: ["README.md"],
      main: "readme",
      homepage_url: @source_url,
      source_ref: "v#{@version}",
      source_url: "https://github.com/data-twister/terminator_uuid",
      groups_for_modules: [
        Models: [
          Terminator.UUID.Performer,
          Terminator.UUID.Role,
          Terminator.UUID.Ability
        ]
      ]
    ]
  end

  defp dialyzer() do
    [
      plt_add_deps: :transitive,
      plt_add_apps: [:ex_unit, :mix],
      flags: [
        :error_handling,
        :race_conditions,
        :underspecs,
        :unmatched_returns
      ]
    ]
  end

  defp aliases do
    [
      c: "compile",
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      test: ["ecto.create", "ecto.migrate", "test"],
      install: ["Terminator.UUID.install", "ecto.setup"]
    ]
  end
end
