defmodule UserPhotoAPI.Web.AuthController do
  use UserPhotoAPI.Web, :controller

  alias UserPhotoAPI.Repo
  alias UserPhotoAPI.User
  
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def login(conn, %{"user" => user_params}) do
    user = Repo.get_by(User, email: user_params["email"])
    cond do
      user && checkpw(user_params["password"], user.password_hash) ->
        conn
        |> put_status(:created)
        |> render("show.json", user: user)
      user ->
        conn
        |> put_status(:unauthorized)
        |> render("error.json", user_params)
      true ->
        dummy_checkpw()
        conn
        |> put_status(:unauthorized)
        |> render("error.json", user_params)
    end
  end

end
