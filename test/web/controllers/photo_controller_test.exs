defmodule UserPhotoAPI.Web.PhotoControllerTest do
  use UserPhotoAPI.Web.ConnCase

  alias UserPhotoAPI.User
  alias UserPhotoAPI.Photo
  
  test "creates photo with valid attributes" do
    changeset = User.changeset(%User{}, %{ email: "valid@email.com", password: "password"})
    {:ok, user} = Repo.insert changeset

    conn = post build_conn(), photo_path(build_conn(), :create), photo: %{url: "valid_url_here", user_id: user.id}
    assert json_response(conn, :created)
  end

  test "does not create photo with incomplete attributes" do
    conn = post build_conn(), photo_path(build_conn(), :create), photo: %{}
    assert json_response(conn, :unprocessable_entity)
  end

  test "creates photo like with valid attributes" do
    changeset = User.changeset(%User{}, %{email: "valid@email.com", password: "password"})
    {:ok, user} = Repo.insert changeset

    changeset = Photo.changeset(%Photo{}, %{url: "url_here", user_id: user.id})
    {:ok, photo} = Repo.insert changeset
    
    conn = post build_conn(), photo_photo_path(build_conn(), :like, photo.id), %{user_id: user.id}
    assert json_response(conn, :created)
  end

end
