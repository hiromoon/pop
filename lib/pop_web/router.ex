defmodule PopWeb.Router do
  use PopWeb, :router

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

  scope "/", PopWeb do
    pipe_through :browser

    get "/", PageController, :hello
    get "/signin", PageController, :index
    post "/signin", PageController, :signin
    # get "consent"
    # post "consent"

    resources "/users", UserController
  end

  scope "/oauth", PopWeb do
    pipe_through :api

    scope "/v2" do
      # get "/authorization"
      # post "/authorization"
      # get "/token"
      # get "/token/introspection"
      # get "/userinfo"
      # get "/jwks"
      get "/.well-known/openid-configuration", DiscoveryController, :index
    end
  end
end
