defmodule TrucksApi.Router do
  use TrucksApi.Web, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", TrucksApi do
    pipe_through :api
    resources "/events", EventController, except: [:new, :edit]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", TrucksApi do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end