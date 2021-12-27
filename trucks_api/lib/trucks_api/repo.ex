defmodule TrucksApi.Repo do
  use Ecto.Repo, otp_app: :trucks_api,
  adapter: Ecto.Adapters.Postgres
end
