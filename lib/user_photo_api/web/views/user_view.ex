defmodule UserPhotoAPI.Web.UserView do
  use UserPhotoAPI.Web, :view

  alias UserPhotoAPI.Web.UserView
  
  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      session_token: user.session_token}
  end

end
