defmodule Terminator.UUID.PerformersRoles do
  @moduledoc false

  use Terminator.UUID.Schema

  schema "terminator_uuid_performers_roles" do
    belongs_to(:performer, Terminator.UUID.Performer)
    belongs_to(:role, Terminator.UUID.Role)

    timestamps()
  end
end
