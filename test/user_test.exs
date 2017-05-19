defmodule UserPhotoAPI.UserTest do
  use ExUnit.Case
  
  alias UserPhotoAPI.User

  @valid_attrs %{email: "valid@email.com", password: "password"}
  @incomplete_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with incomplete attributes" do
    changeset = User.changeset(%User{}, @incomplete_attrs)
    refute changeset.valid?
  end

end
