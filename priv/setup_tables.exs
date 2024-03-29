defmodule Terminator.UUID.Repo.Migrations.SetupTables do
  use Ecto.Migration

  alias Terminator.UUID.Config

  def change do
    key_type = Config.key_type(:migration)

    create table(:terminator_uuid_performers, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:abilities, {:array, :string}, default: [])

      timestamps()
    end

    create table(:terminator_uuid_roles, primary_key: false) do
      key_type = Config.key_type(:migration)

      add(:id, key_type, primary_key: true)
      add(:identifier, :string)
      add(:name, :string, size: 255)
      add(:abilities, {:array, :string}, default: [])

      timestamps()
    end

    create(unique_index(:terminator_uuid_roles, [:identifier]))

    create table(:terminator_uuid_performers_roles, primary_key: false) do
      key_type = Config.key_type(:migration)

      add(:id, key_type, primary_key: true)
      add(:performer_id, references(:terminator_uuid_performers, type: :uuid))
      add(:role_id, references(:terminator_uuid_roles, type: :uuid))

      timestamps()
    end

    create table(:terminator_uuid_abilities, primary_key: false) do
      key_type = Config.key_type(:migration)

      add(:id, key_type, primary_key: true)
      add(:identifier, :string)
      add(:name, :string, size: 255)

      timestamps()
    end

    create(unique_index(:terminator_uuid_abilities, [:identifier]))

    create table(:terminator_uuid_performers_entities, primary_key: false) do
      key_type = Config.key_type(:migration)

      add(:id, key_type, primary_key: true)
      add(:performer_id, references(Terminator.UUID.Performer.table(), type: :uuid))
      add(:assoc_id, :uuid)
      add(:assoc_type, :string)
      add(:abilities, {:array, :string})

      timestamps()
    end
  end
end
