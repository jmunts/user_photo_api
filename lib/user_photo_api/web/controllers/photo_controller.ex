defmodule UserPhotoAPI.Web.PhotoController do
  use UserPhotoAPI.Web, :controller

  alias UserPhotoAPI.Photo
  alias UserPhotoAPI.PhotoLike

  action_fallback UserPhotoAPI.Web.FallbackController
  
  def show(conn, %{"id" => id}) do
    photo = Photo.get_photo!(id)
    render(conn, "show.json", photo: photo)
  end

  def create(conn, %{"photo" => photo_params}) do
    with {:ok, %Photo{} = photo} <- Photo.create_photo(photo_params) do
      photo = Photo.get_photo!(photo.id) # to get preloaded %Photo{}
      conn
      |> put_status(:created)
      |> put_resp_header("location", photo_path(conn, :show, photo))
      |> render("show.json", photo: photo)
    end
  end

  def like(conn, %{"photo_id" => photo_id, "user_id" => user_id}) do
    with {:ok, %PhotoLike{}} <- Photo.like_photo(%{photo_id: photo_id, user_id: user_id}) do
      photo = Photo.get_photo!(photo_id)
      conn
      |> put_status(:created)
      |> put_resp_header("location", photo_path(conn, :show, photo))
      |> render("show.json", photo: photo)
    end

  end

end
