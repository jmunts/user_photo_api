# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :user_photo_api,
  namespace: UserPhotoAPI,
  ecto_repos: [UserPhotoAPI.Repo]

# Configures the endpoint
config :user_photo_api, UserPhotoAPI.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v2EpURMnMkmHWswG25BHpMqvwKRIMOpa8eekOULiK/JMatJPgun3rpNeRVdZI68M",
  render_errors: [view: UserPhotoAPI.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: UserPhotoAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
