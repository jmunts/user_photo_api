defmodule UserPhotoAPI.Account do
  import Ecto.Query

  alias UserPhotoAPI.Repo
  alias UserPhotoAPI.Account.User
  alias UserPhotoAPI.Account.Photo
  alias UserPhotoAPI.Account.PhotoLike

  def get_photo!(id) do
    Photo
    |> Repo.get!(id)
    |> Repo.preload(:photo_likes)
  end

  def create_photo(attrs \\ %{}) do
    %Photo{}
    |> Photo.changeset(attrs)
    |> Repo.insert()
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert
  end

  def like_photo(attrs \\ %{}) do
    %PhotoLike{}
    |> PhotoLike.changeset(attrs)
    |> Repo.insert
  end

end
