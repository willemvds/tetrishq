defmodule TetrishqWeb.ReplaysController do
  use TetrishqWeb, :controller

  def index(conn, params) do
    # The home page is often custom made,
    # so skip the default app layout.
    IO.inspect(params)

    if upload = params["ff"] do
      extension = Path.extname(upload.filename)
      IO.puts(extension)
      Tetrishq.Replays.Commands.create_from_file(upload.path)
    else
      IO.puts("Eh wha?")
    end

    render(conn, :index, layout: false)
  end
end
