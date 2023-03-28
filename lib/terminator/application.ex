defmodule Terminator.UUID.Application do
  @moduledoc false
  use Application

  alias Terminator.UUID.Config

  def start(_type, args) do

    repo = Config.repo()

    children = [
      {repo, args},
      {Terminator.UUID.Registry, []}
    ]

    opts = [strategy: :one_for_one, name: Terminator.UUID.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
