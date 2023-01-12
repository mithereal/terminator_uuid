defmodule Terminator.PerformersRoles do
  @moduledoc false

  use Terminator.Schema

  schema "terminator_performers_roles" do
    belongs_to(:performer, Terminator.Performer, type: :binary_id)
    belongs_to(:role, Terminator.Role, type: :binary_id)

    timestamps()
  end
end
