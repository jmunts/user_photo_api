defmodule UserPhotoAPI.Web.Router do
  use UserPhotoAPI.Web, :router

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UserPhotoAPI.Web do
    pipe_through :api
    pipe_through :api_auth

    resources "/photos", PhotoController, only: [:show, :create] do
      post "/like", PhotoController, :like
    end
    resources "/users", UserController, only: [:show, :create]

    post "/auth/login", AuthController, :login
    delete "/auth/logout", AuthController, :logout
  end
end
