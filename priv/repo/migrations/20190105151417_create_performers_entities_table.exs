defmodule Terminator.UUID.Repo.Migrations.CreatePerformersEntitiesTable do
  use Ecto.Migration

  def change do
    create table(:terminator_uuid_performers_entities, primary_key: false) do
      add :id, :uuid, primary_key: true
      add(:performer_id, references(Terminator.UUID.Performer.table(), type: :uuid))
      add(:assoc_id, :integer)
      add(:assoc_type, :string)
      add(:abilities, {:array, :string})

      timestamps()
    end
  end
end
