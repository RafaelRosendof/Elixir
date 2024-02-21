defmodule Figas.Repo do
  use Ecto.Repo,
    otp_app: :figas,
    adapter: Ecto.Adapters.Postgres
end
