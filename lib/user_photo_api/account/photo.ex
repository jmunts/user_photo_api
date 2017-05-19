defmodule UserPhotoAPI.Account.Photo do
  use Ecto.Schema
  import Ecto.Changeset
  alias UserPhotoAPI.Account.Photo
  alias UserPhotoAPI.Account.User
  alias UserPhotoAPI.Account.PhotoLike


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
end
