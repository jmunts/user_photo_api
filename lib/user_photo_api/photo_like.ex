defmodule UserPhotoAPI.PhotoLike do
  use Ecto.Schema
  import Ecto.Changeset
  alias UserPhotoAPI.PhotoLike
  alias UserPhotoAPI.User
  alias UserPhotoAPI.Photo

  schema "photo_likes" do
    belongs_to :user, User
    belongs_to :photo, Photo
    
    timestamps()
  end

  @doc false
  def changeset(%PhotoLike{} = photo_like, attrs) do
    photo_like
    |> cast(attrs, [:user_id, :photo_id])
    |> validate_required([:user_id, :photo_id])
  end
end
