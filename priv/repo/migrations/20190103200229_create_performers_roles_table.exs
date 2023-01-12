defmodule Terminator.Repo.Migrations.CreatePerformersRolesTable do
  use Ecto.Migration

  def change do
    create table(:terminator_performers_roles, primary_key: false) do
      add :id, :uuid, primary_key: true
      add(:performer_id, references(:terminator_performers))
      add(:role_id, references(:terminator_roles))

      timestamps()
    end
  end
end
