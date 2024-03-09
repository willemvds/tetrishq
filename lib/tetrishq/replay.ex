defmodule TetrisHQ.Replay do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id
  schema "replays" do
    field :uploaded_at, :utc_datetime_usec
  end

  @doc false
  def changeset(replay, attrs) do
    replay
    |> cast(attrs, [:uploaded_at])
    |> validate_required([:uploaded_at])
  end
end
