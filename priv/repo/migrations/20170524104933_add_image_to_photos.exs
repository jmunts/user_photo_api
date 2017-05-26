defmodule UserPhotoAPI.Repo.Migrations.AddImageToPhotos do
  use Ecto.Migration

  def change do
    alter table(:photos) do
      add :image, :string
    end
  end
end
