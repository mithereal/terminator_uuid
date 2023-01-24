defmodule Mix.Tasks.Terminator.UUID do
  use Mix.Task

  @spec run(any()) :: any()
  def run(_) do
    {:ok, _} = Application.ensure_all_started(:terminator_uuid)
    Mix.shell().info("Terminator v#{Application.spec(:terminator_uuid, :vsn)}")
    Mix.shell().info("A toolkit for granular user abilities management.")
    Mix.shell().info("\nAvailable tasks:\n")
    Mix.Tasks.Help.run(["--search", "terminator."])
  end
end
