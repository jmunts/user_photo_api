defmodule UserPhotoAPI.Web.UserController do
  use UserPhotoAPI.Web, :controller

  alias UserPhotoAPI.Account
  alias UserPhotoAPI.Account.User

  action_fallback UserPhotoAPI.Web.FallbackController

  def show(conn, %{"id" => id}) do
    user = Account.get_user!(id)
    render(conn, "show.json", user: user)
  end

  
  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Account.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

end
