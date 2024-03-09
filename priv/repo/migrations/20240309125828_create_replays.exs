defmodule TetrisHQ.Repo.Migrations.CreateReplays do
  use Ecto.Migration

  def change do
    create table(:replays, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :uploaded_at, :utc_datetime_usec
    end
  end
end
