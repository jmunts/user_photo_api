defmodule UserPhotoAPI.Web.UserController do
  use UserPhotoAPI.Web, :controller

  alias UserPhotoAPI.User

  action_fallback UserPhotoAPI.Web.FallbackController

  def show(conn, %{"id" => id}) do
    user = User.get_user!(id)
    render(conn, "show.json", user: user)
  end

  
  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- User.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

end
