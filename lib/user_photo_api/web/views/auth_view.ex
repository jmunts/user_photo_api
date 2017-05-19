defmodule UserPhotoAPI.Web.AuthView do
  use UserPhotoAPI.Web, :view

  def render("show.json", %{user: user}) do
    %{data: %{id: user.id,
              email: user.email,
              session_token: user.session_token}}
  end

  def render("error.json", _) do
    %{errors: %{detail: "Failed to authenticate"}}
  end

end
