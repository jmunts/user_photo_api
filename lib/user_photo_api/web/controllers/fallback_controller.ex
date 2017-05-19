defmodule UserPhotoAPI.Web.FallbackController do
  use UserPhotoAPI.Web, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(UserPhotoAPI.Web.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(UserPhotoAPI.Web.ErrorView, "404.json")
  end


end
