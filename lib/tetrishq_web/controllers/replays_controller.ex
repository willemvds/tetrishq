defmodule TetrisHQWeb.ReplaysController do
  use TetrisHQWeb, :controller

  def index(conn, _params) do
    replays = TetrisHQ.Replays.Queries.most_recent()

    view_replays =
      Enum.map(replays, fn replay -> %{replay | id: Base.encode16(replay.id, case: :lower)} end)

    render(
      conn,
      :index,
      layout: false,
      replays: view_replays
    )
  end

  def upload(conn, params) do
    IO.inspect(params)

    if upload = params["replay"] do
      extension = Path.extname(upload.filename)
      IO.puts(extension)
      TetrisHQ.Replays.Commands.create_from_file(upload.path)
    else
      IO.puts("Eh wha?")
    end

    replays = TetrisHQ.Replays.Queries.most_recent()
    render(conn, :index, layout: false, replays: replays)
  end
end
