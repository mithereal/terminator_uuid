defmodule Terminator.UUID.Repo.Migrations.CreateAbilitiesTable do
  use Ecto.Migration

  def change do
    key_type = ExCatalog.Config.key_type(:migration)

    create table(:terminator_uuid_abilities, primary_key: false) do
      add :id, key_type, primary_key: true
      add(:identifier, :string)
      add(:name, :string, size: 255)

      timestamps()
    end

    create(unique_index(:terminator_uuid_abilities, [:identifier]))
  end
end
