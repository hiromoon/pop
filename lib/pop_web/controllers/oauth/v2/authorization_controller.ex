defmodule PopWeb.Authorizationcontroller do
  use PopWeb, :controller

  def index(conn, _) do
    # conn = Plug.Conn.put_session(conn, :pop_auth, "hoge")
    redirect conn, to: "/signin"
  end
end
