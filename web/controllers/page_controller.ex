defmodule Pop.PageController do
  use Pop.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def signin(conn, _params) do
    render conn, "signin.html"
  end
end
