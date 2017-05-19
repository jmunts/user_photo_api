defmodule UserPhotoAPI.Repo.Migrations.CreateUserPhotoAPI.Photo do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :url, :string
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:photos, [:user_id])
  end
end
