defmodule Terminator.UUID.Repo.Migrations.CreatePerformersEntitiesTable do
  use Ecto.Migration

  def change do
    key_type = ExCatalog.Config.key_type(:migration)

    create table(:terminator_uuid_performers_entities, primary_key: false) do
      add :id, key_type, primary_key: true
      add(:performer_id, references(Terminator.UUID.Performer.table()))
      add(:assoc_id, :uuid)
      add(:assoc_type, :string)
      add(:abilities, {:array, :string})

      timestamps()
    end
  end
end
