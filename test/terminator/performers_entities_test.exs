defmodule Terminator.UUID.PerformersEntitiesTest do
  use Terminator.UUID.EctoCase
  alias Terminator.UUID.PerformersEntities

  describe "Terminator.UUID.PerformersEntities.create/3" do
    test "creates entity relation for performer" do
      performer = insert(:performer)
      struct = insert(:role)
      abilities = ["test_ability"]

      PerformersEntities.create(performer, struct, abilities)

      performer = performer |> Repo.preload([:entities])

      assert 1 == length(performer.entities)
      assert "elixir_terminator_uuid_role" == Enum.at(performer.entities, 0).assoc_type
    end

    test "creates entity relation for performer without abilities" do
      performer = insert(:performer)
      struct = insert(:role)

      PerformersEntities.create(performer, struct)

      performer = performer |> Repo.preload([:entities])

      assert 1 == length(performer.entities)
      assert "elixir_terminator_uuid_role" == Enum.at(performer.entities, 0).assoc_type
    end
  end
end
