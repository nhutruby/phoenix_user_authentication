# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_user_authentication,
  ecto_repos: [PhoenixUserAuthentication.Repo]

# Configures the endpoint
config :phoenix_user_authentication, PhoenixUserAuthenticationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mu4KhYSGU6VkJoxkGtc7MzvSaAo2DDdTudMGYHjbr6pfW8GodsNN2C/R5Dvczm7E",
  render_errors: [view: PhoenixUserAuthenticationWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixUserAuthentication.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "k5jr2DWo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
config :guardian, PhoenixUserAuthentication.Users.Guardian,
  issuer: "PhoenixUserAuthentication",
  secret_key: "4h6uXTPqhSIWzCi0x+P04me1BQQM3qm7dDoXJ8o9QZt6AD+qvAZKZms9414RDQzY" # put the result of the mix command above here