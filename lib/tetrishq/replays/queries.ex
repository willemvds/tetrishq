defmodule TetrisHQ.Replays.Queries do
  import Ecto.Query

  def most_recent() do
    query =
      from r in TetrisHQ.Replay,
        order_by: r.uploaded_at,
        limit: 10

    TetrisHQ.Repo.all(query)
  end
end
