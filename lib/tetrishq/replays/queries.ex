defmodule TetrisHQ.Replays.Queries do
  import Ecto.Query

  def most_recent() do
    query =
      from r in TetrisHQ.Replay,
        order_by: r.uploaded_at,
        limit: 10

    TetrisHQ.Repo.all(query)
  end

  def recording_stats(recording_path) do
    recording_stats_result =
      :exec.run("tetris recording-stats #{recording_path}", [:sync, :stdout])

    case recording_stats_result do
      {:ok, recording_stats_json} ->
        IO.inspect(recording_stats_json)
        {:ok, recording_stats_json}

      {:error, err} ->
        IO.inspect(err)
        {:error, err}
    end
  end
end
