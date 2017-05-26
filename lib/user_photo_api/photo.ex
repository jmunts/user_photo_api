defmodule UserPhotoAPI.Photo do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias UserPhotoAPI.Repo
  alias UserPhotoAPI.Photo
  alias UserPhotoAPI.User
  alias UserPhotoAPI.PhotoLike

  
  schema "photos" do
    field :image, UserPhotoAPI.Image.Type
    belongs_to :user, User
    has_many :photo_likes, PhotoLike

    timestamps()
  end

  @doc false
  def changeset(%Photo{} = photo, attrs) do
    photo
    |> cast(attrs, [:user_id])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:user_id, :image])
  end

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

  def like_photo(attrs \\ %{}) do
    %PhotoLike{}
    |> PhotoLike.changeset(attrs)
    |> Repo.insert
  end

end
