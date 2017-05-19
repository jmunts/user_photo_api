defmodule UserPhotoAPI.Repo.Migrations.CreateUserPhotoAPI.PhotoLike do
  use Ecto.Migration

  def change do
    create table(:photo_likes) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :photo_id, references(:photos, on_delete: :delete_all)

      timestamps()
    end

    create index(:photo_likes, [:user_id])
    create index(:photo_likes, [:photo_id])
  end
end
