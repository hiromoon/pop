defmodule PopWeb.Authorizationcontroller do
  use PopWeb, :controller
  import Plug.Conn

  def index(conn, params) do
    conn
    |> validation_required(params, ["scope", "response_type", "redirect_uri", "client_id"])
    |> check_openid_scope(params)
    |> check_redirect_uri_format(params)
    |> check_response_type(params)
    |> put_resp_cookie("_pop_auth", "hoge")
    |> redirect(to: "/signin")
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

  defp check_openid_scope(conn, params) do
    result = params["scope"]
             |> String.split(" ")
             |> Enum.member?("openid")

    case result do
      true -> conn
      false -> raise "Invalid Request"
    end
  end

  defp check_redirect_uri_format(conn, params) do
    pattern = ~r/https?:\/\/[a-zA-Z0-9\/.+=-]+/
    result = Regex.match?(pattern, params["redirect_uri"])
    case result do
      true -> conn
      false -> raise "Invalid Request"
    end
  end

  defp check_response_type(conn, params) do
    supported_types = [
      "code",
      "id_token",
      "token",
      "id_token token",
      "code token",
      "code id_token",
      "code id_token token"
    ]
    result = Enum.any?(supported_types, fn(x) -> x == params["response_type"] end)
    case result do
      true -> conn
      false -> raise "Invalid Request"
    end
  end
end
