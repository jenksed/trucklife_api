# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :trucks_api,
  ecto_repos: [TrucksApi.Repo]

# Configures the endpoint
config :trucks_api, TrucksApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vrD4KyEwMel4nkXrxxPBHMuVzKbI1YCvhSaLFYyxhC2mGOm8vpeZxFsaJ73BSMlV",
  render_errors: [view: TrucksApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: TrucksApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :json_library, Jason