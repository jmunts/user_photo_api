defmodule UserPhotoAPI.Repo.Migrations.AddSessionTokenToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :session_token, :string
    end
  end
end
