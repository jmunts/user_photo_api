defmodule UserPhotoAPI.PhotoTest do
  use ExUnit.Case
  
  alias UserPhotoAPI.Photo

  @valid_attrs %{url: "photo_url_here", user_id: 1}
  @incomplete_attrs %{}

  test "changeset with valid attributes" do
    changeset = Photo.changeset(%Photo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with incomplete attributes" do
    changeset = Photo.changeset(%Photo{}, @incomplete_attrs)
    refute changeset.valid?
  end

end
