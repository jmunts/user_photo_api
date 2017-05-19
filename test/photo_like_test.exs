defmodule UserPhotoAPI.PhotoLikeTest do
  use ExUnit.Case
  
  alias UserPhotoAPI.PhotoLike

  @valid_attrs %{photo_id: 1, user_id: 1}
  @incomplete_attrs %{}

  test "changeset with valid attributes" do
    changeset = PhotoLike.changeset(%PhotoLike{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with incomplete attributes" do
    changeset = PhotoLike.changeset(%PhotoLike{}, @incomplete_attrs)
    refute changeset.valid?
  end

end
