defmodule Pop.Router do
  use Pop.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Pop do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :hello
    get "/signin", PageController, :index
    post "/signin", PageController, :signin

    resources "/users", UserController
  end

  scope "/oauth", Pop do
    pipe_through :api

    scope "/v2" do
      get "/.well-known/openid-configuration", DiscoveryController, :index
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Pop do
  #   pipe_through :api
  # end
end
