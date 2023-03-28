defmodule Terminator.UUID.Repo.Migrations.CreatePerformersRolesTable do
  use Ecto.Migration

  def change do
    key_type = ExCatalog.Config.key_type(:migration)

    create table(:terminator_uuid_performers_roles, primary_key: false) do
      add(:id, key_type, primary_key: true)
      add(:performer_id, references(:terminator_uuid_performers))
      add(:role_id, references(:terminator_uuid_roles))

      timestamps()
    end
  end
end
