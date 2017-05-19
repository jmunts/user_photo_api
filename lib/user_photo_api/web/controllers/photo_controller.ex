defmodule UserPhotoAPI.Web.PhotoController do
  use UserPhotoAPI.Web, :controller

  alias UserPhotoAPI.Account
  alias UserPhotoAPI.Account.Photo
  alias UserPhotoAPI.Account.PhotoLike

  action_fallback UserPhotoAPI.Web.FallbackController
  
  def show(conn, %{"id" => id}) do
    photo = Account.get_photo!(id)
    render(conn, "show.json", photo: photo)
  end

  def create(conn, %{"photo" => photo_params}) do
    with {:ok, %Photo{} = photo} <- Account.create_photo(photo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", photo_path(conn, :show, photo))
      |> render("show.json", photo: photo)
    end
  end

  def like(conn, %{"photo_id" => photo_id, "user_id" => user_id}) do
    with {:ok, %PhotoLike{} = photo_like} <- Account.like_photo(%{photo_id: photo_id, user_id: user_id}) do
      photo = Account.get_photo!(photo_id)
      conn
      |> put_status(:created)
      |> put_resp_header("location", photo_path(conn, :show, photo))
      |> render("show.json", photo: photo)
    end

  end

end
