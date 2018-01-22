defmodule PopWeb.Authorizationcontroller do
  use PopWeb, :controller
  import Plug.Conn

  def index(conn, params) do
    conn
    |> validation_required(params, ["scope", "response_type", "redirect_uri", "client_id"])
    |> put_resp_cookie("_pop_auth", "hoge")
    |> redirect to: "/signin"
  end

  defp validation_required(conn, params, list) do
    case check_required(params, list) do
      true -> conn
      false -> raise "Invalid Request"
    end
  end

  defp check_required(params, list) do
    list
    |> Enum.map(fn(x) -> Map.has_key?(params, x) end)
    |> Enum.all?(fn(x) -> x end)
  end
end
