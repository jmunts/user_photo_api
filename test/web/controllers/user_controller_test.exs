defmodule UserPhotoAPI.Web.UserControllerTest do
  use UserPhotoAPI.Web.ConnCase

  @valid_attrs %{email: "valid@email.com", password: "password"}
  @incomplete_attrs %{email: "valid@email.com"}
  
  test "creates user with valid attributes" do
    conn = post build_conn(), user_path(build_conn(), :create), user: @valid_attrs
    assert json_response(conn, :created)
  end

  test "does not create user with incomplete attributes" do
    conn = post build_conn(), user_path(build_conn(), :create), user: @incomplete_attrs
    assert json_response(conn, :unprocessable_entity)
  end

end
