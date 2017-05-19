defmodule UserPhotoAPI.Web.PhotoView do
  use UserPhotoAPI.Web, :view

  alias UserPhotoAPI.Web.PhotoView

  def render("show.json", %{photo: photo}) do
    %{data: render_one(photo, PhotoView, "photo.json")}
  end

  def render("photo.json", %{photo: photo}) do
    %{id: photo.id,
      url: photo.url}
  end

end
