defmodule Pop.Repo do
  use Ecto.Repo,
    otp_app: :pop,
    adapter: Ecto.Adapters.MyXQL
end
