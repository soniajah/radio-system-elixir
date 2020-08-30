defmodule RadioSystemProjectWeb.Router do
  use RadioSystemProjectWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RadioSystemProjectWeb do
    pipe_through :api
  end

  pipeline :browser do
    plug(:accepts, ["json"])
  end

  scope "/", RadioSystemProjectWeb do
    pipe_through :browser
    resources "/radios", RadioController, except: [:new, :edit]

    get "/", DefaultController, :index
    post "/radios2/:id", RadioController, :api_create
    post "/radios2/:id/location", RadioController, :api_update_location
    get "/radios2/:id/location", RadioController, :api_get_location
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: RadioSystemProjectWeb.Telemetry
    end
  end
end
