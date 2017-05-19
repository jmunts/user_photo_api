defmodule UserPhotoAPI.Account.Photo do
  use Ecto.Schema
  import Ecto.Changeset
  alias UserPhotoAPI.Account.Photo
  alias UserPhotoAPI.Account.User


  schema "photos" do
    field :url, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Photo{} = photo, attrs) do
    photo
    |> cast(attrs, [:url, :user_id])
    |> validate_required([:url, :user_id])
  end
end
