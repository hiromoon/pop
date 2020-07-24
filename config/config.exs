# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pop,
  ecto_repos: [Pop.Repo]

# Configures the endpoint
config :pop, PopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TcQSpJlxIZtUVNuNzwKutGqyPztGK9JLhdU5tl8GJ2WxUnrqz5g8sTTIAmd9NDWf",
  render_errors: [view: PopWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pop.PubSub,
  live_view: [signing_salt: "pIA8UMtv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
