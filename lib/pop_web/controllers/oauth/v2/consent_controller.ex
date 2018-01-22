defmodule  PopWeb.ConsentController do
  use PopWeb, :controller

  def index(conn, _) do
    render conn, "consent.html"
  end

  def consent(conn, _) do
    redirect conn, to: "/users"
  end
end
