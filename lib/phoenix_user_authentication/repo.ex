defmodule PhoenixUserAuthentication.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_user_authentication,
    adapter: Ecto.Adapters.Postgres
end
