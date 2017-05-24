defmodule UserPhotoAPI.Web.AuthView do
  use UserPhotoAPI.Web, :view

  def render("login.json", %{user: user, jwt: jwt, exp: exp}) do
    %{data: %{user_id: user.id,
              jwt: jwt,
              exp: exp}}
  end

  def render("logout.json", _) do
    %{data: %{detail: "Successfully logged out"}}
  end

  def render("no_session.json", _) do
    %{data: %{detail: "No user logged in"}}
  end



  def render("error.json", %{message: message}) do
    %{errors: %{detail: message}}
  end

  def render("error.json", _) do
    %{errors: %{detail: "Something went wrong"}}
  end

end
