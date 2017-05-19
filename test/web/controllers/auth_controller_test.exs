defmodule UserPhotoAPI.Web.AuthControllerTest do
  use UserPhotoAPI.Web.ConnCase

  alias UserPhotoAPI.User
  @valid_attrs %{email: "valid@email.com", password: "password"}
  @invalid_attrs %{email: "valid@email.com", password: "wrong_password"}

  setup %{conn: conn} do
    changeset = User.changeset(%User{}, @valid_attrs)
    Repo.insert changeset
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "renders with valid credentials" do
    conn = post build_conn(), auth_path(build_conn(), :login), user: @valid_attrs
    assert json_response(conn, :created)
  end

  test "render with invalid credentiasl" do
    conn = post build_conn(), auth_path(build_conn(), :login), user: @invalid_attrs
    assert json_response(conn, :unauthorized)
  end

end
