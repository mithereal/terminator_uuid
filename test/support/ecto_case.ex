defmodule Terminator.UUID.EctoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Terminator.UUID.Repo

      import Ecto
      import Ecto.Query
      import Terminator.UUID.EctoCase
      import Terminator.UUID.Factory

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Terminator.UUID.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Terminator.UUID.Repo, {:shared, self()})
    end

    :ok
  end
end
