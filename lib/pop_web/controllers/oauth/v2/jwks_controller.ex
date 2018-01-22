defmodule PopWeb.JWKSController do
  use PopWeb, :controller

  def index(conn, _) do
    jwk = get_public_jwk("./rsa-2048.pem")
    json conn, %{
      "keys" => [
        jwk
      ]
    }
  end

  defp get_public_jwk (private_key) do
    public_jwk = JOSE.JWK.from_pem_file(private_key) |> JOSE.JWK.to_public()
    kid = JOSE.JWK.thumbprint(public_jwk)
    {_, jwk} = JOSE.JWK.to_map(public_jwk)
    jwk
    |> Map.put(:kid, kid)
    |> Map.put(:use, "sig")
  end
end
