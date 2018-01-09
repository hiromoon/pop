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
    resources "/sessions", SessionController, only: [:new, :create, :delete],
                                              singleton: true
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Pop.Accounts.get_user!(user_id))
    end
  end

scope "/manage", PopWeb.Manage, as: :manage do
  pipe_through :browser
  resources "/clients", ClientController
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
