defmodule Terminator.UUID.Repo.Migrations.CreatePerformersTable do
  use Ecto.Migration

  def change do
    key_type = ExCatalog.Config.key_type(:migration)

    create table(:terminator_uuid_performers, primary_key: false) do
      add :id, key_type, primary_key: true
      add(:abilities, {:array, :string}, default: [])

      timestamps()
    end
  end
end
