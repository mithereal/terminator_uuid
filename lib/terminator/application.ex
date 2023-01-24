defmodule Terminator.UUID.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Terminator.UUID.Registry, [])
    ]

    children = children ++ load_repos()

    opts = [strategy: :one_for_one, name: Terminator.UUID.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp load_repos do
    case Application.get_env(:terminator_uuid, :ecto_repos) do
      nil -> [Terminator.UUID.Repo]
      repos -> repos
    end
  end
end
