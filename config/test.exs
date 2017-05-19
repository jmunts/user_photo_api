use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :user_photo_api, UserPhotoAPI.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :user_photo_api, UserPhotoAPI.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "user_photo_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
