defmodule PopWeb.DiscoveryController do
  use PopWeb, :controller

  def index(conn, _params) do
    json conn, %{
      issuer: "localhost",
      authorization_endpoint: "http://localhost:4000/oauth/v2/authorization",
      token_endpoint: "http://localhost:4000/oauth/v2/token",
      userinfo_endpoint: "http://localhost:4000/oauth/v2/userinfo",
      jwks_uri: "http://localhost:4000/oauth/v2/jwks",
      scopes_supported: ["openid", "profile", "email"],
      response_types_supported: ["code", "id_token", "token id_token"],
      grant_types_supported: ["authorization_code", "implicit"],
      subject_types_supported: ["public"],
      id_token_signing_alg_values_supported: ["RS256"]
    }
  end
end
