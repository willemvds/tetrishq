defmodule TetrisHQWeb.ReplaysController do
  use TetrisHQWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end

  def upload(conn, params) do
    IO.inspect(params)

    if upload = params["replay"] do
      extension = Path.extname(upload.filename)
      IO.puts(extension)
      Tetrishq.Replays.Commands.create_from_file(upload.path)
    else
      IO.puts("Eh wha?")
    end

    render(conn, :index, layout: false)
  end
end
