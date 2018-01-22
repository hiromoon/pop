defmodule PopWeb.PageController do
  use PopWeb, :controller

  def index(conn, _params) do
    render conn, "signin.html"
  end

  def hello(conn, _params) do
    render conn, "index.html"
  end

  def signin(conn, _params) do
    redirect conn, to: "/"
  end
end