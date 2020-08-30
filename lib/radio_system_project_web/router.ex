defmodule RadioSystemProjectWeb.Router do
  use RadioSystemProjectWeb, :router 

  pipeline :browser do
    plug(:accepts, ["json"])
  end

  scope "/", RadioSystemProjectWeb do
    pipe_through :browser
    post "/radios/:id", RadioController, :api_create
    post "/radios/:id/location", RadioController, :api_update_location
    get "/radios/:id/location", RadioController, :api_get_location
  end
end