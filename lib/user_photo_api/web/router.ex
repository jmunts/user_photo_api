defmodule UserPhotoAPI.Web.Router do
  use UserPhotoAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UserPhotoAPI.Web do
    pipe_through :api
  end
end
