defmodule UserPhotoAPI.Web.PhotoView do
  use UserPhotoAPI.Web, :view

  alias UserPhotoAPI.Web.PhotoView

  def render("show.json", %{photo: photo}) do
    %{data: render_one(photo, PhotoView, "photo.json")}
  end

  def render("photo.json", %{photo: photo}) do
    %{id: photo.id,
      url: photo.url,
      user_id: photo.user_id,
      likes_count: photo_likes_count(photo),
      likes_user_ids: photo_likes_uids(photo)}
  end

  defp photo_likes_count(photo) do
    photo.photo_likes
    |> Enum.count
  end

  defp photo_likes_uids(photo) do
    photo.photo_likes
    |> Enum.map(&(&1.user_id))
  end

end
