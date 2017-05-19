defmodule UserPhotoAPI.Photo do
  use Ecto.Schema
  import Ecto.Changeset
  alias UserPhotoAPI.Repo
  alias UserPhotoAPI.Photo
  alias UserPhotoAPI.User
  alias UserPhotoAPI.PhotoLike


  schema "photos" do
    field :url, :string
    belongs_to :user, User
    has_many :photo_likes, PhotoLike

    timestamps()
  end

  @doc false
  def changeset(%Photo{} = photo, attrs) do
    photo
    |> cast(attrs, [:url, :user_id])
    |> foreign_key_constraint(:user_id)
    |> validate_required([:url, :user_id])
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
