defmodule RadioSystemProject.Repo do
  use Ecto.Repo,
    otp_app: :radio_system_project,
    adapter: Ecto.Adapters.Postgres
end
