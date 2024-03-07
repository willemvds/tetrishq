defmodule TetrisHQ.Repo do
  use Ecto.Repo,
    otp_app: :tetrishq,
    adapter: Ecto.Adapters.SQLite3
end
