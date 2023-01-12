defmodule Terminator.UUID.Repo.Migrations.CreatePerformersRolesTable do
  use Ecto.Migration

  def change do
    create table(:terminator_uuid_performers_roles, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :performer_id, references(:terminator_uuid_performers, type: :uuid)
      add :role_id, references(:terminator_uuid_roles, type: :uuid)

      timestamps()
    end
  end
end
