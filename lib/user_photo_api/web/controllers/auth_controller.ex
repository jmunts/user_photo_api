defmodule UserPhotoAPI.Web.AuthController do
  use UserPhotoAPI.Web, :controller

  alias UserPhotoAPI.Repo
  alias UserPhotoAPI.User
  
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def login(conn, %{"user" => user_params}) do
    user = Repo.get_by(User, email: user_params["email"])
    cond do
      user && checkpw(user_params["password"], user.password_hash) ->
        new_conn = Guardian.Plug.api_sign_in(conn, user)
        jwt = Guardian.Plug.current_token(new_conn)
        {:ok, claims} = Guardian.Plug.claims(new_conn)
        exp = Map.get(claims, "exp")

        new_conn
        |> put_resp_header("authorization", "Bearer #{jwt}")
        |> put_resp_header("x-expires", "#{exp}")
        |> render("login.json", user: user, jwt: jwt, exp: exp)
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

  def login(conn, %{}) do
    conn
    |> put_status(:unauthorized)
    |> render("error.json", message: "Please input email and password")
  end


  def logout(conn, _params) do
    jwt = Guardian.Plug.current_token(conn)
    case Guardian.Plug.claims(conn) do
      {:ok, claims} ->
        Guardian.revoke!(jwt, claims)
        conn
        |> put_status(:ok)
        |> render("logout.json")
      {:error, :no_session} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("no_session.json")
      _ ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

end
