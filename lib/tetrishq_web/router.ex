defmodule TetrishqWeb.Router do
  use TetrishqWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TetrishqWeb.Layouts, :root}
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TetrishqWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TetrishqWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/replays", ReplaysController, :index
    post "/replays", ReplaysController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TetrishqWeb do
  #   pipe_through :api
  # end
end
