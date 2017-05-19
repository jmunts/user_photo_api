defmodule UserPhotoAPI.Account.Photo do
  use Ecto.Schema
  import Ecto.Changeset
  alias UserPhotoAPI.Account.Photo


  schema "photos" do
    field :url, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Photo{} = photo, attrs) do
    photo
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
