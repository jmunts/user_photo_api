defmodule UserPhotoAPI.Web.Router do
  use UserPhotoAPI.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UserPhotoAPI.Web do
    pipe_through :api

    resources "/photos", PhotoController, only: [:show, :create] do
      post "/like", PhotoController, :like
    end
    resources "/users", UserController, only: [:show, :create]

    post "/auth/login", AuthController, :login
  end
end
