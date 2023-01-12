defmodule Terminator.Repo.Migrations.CreatePerformersTable do
  use Ecto.Migration

  def change do
    create table(:terminator_performers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add(:abilities, {:array, :string}, default: [])

      timestamps()
    end
  end
end
