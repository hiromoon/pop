# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pop,
  ecto_repos: [Pop.Repo]

# Configures the endpoint
config :pop, PopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qAv/ih2mSO5BT++APG/ixEd5VbTLIFS19vA+CZACGyH+L8stpTZgcaKMFtr+KM+C",
  render_errors: [view: PopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pop.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
