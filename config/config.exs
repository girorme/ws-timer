# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :wstimer, WstimerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SIYImmim1L84YZKS7xUzIxaOHeLyCTxcjNO+HOYq6b1ew/rZPrh2nc4/BLX1trPw",
  render_errors: [view: WstimerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Wstimer.PubSub,
  live_view: [signing_salt: "F1cYO3T8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
