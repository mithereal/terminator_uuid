defmodule Mix.Tasks.Terminator.UUID.Setup do
  use Mix.Task

  @shortdoc "Setup terminator tables"

  def run(_argv) do
    Mix.Tasks.Ecto.Migrate.run(["-r", "Terminator.UUID.Repo"])
  end
end
