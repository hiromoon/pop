defmodule Pop.Manage.Client do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pop.Manage.Client


  schema "clients" do
    field :name, :string
    field :redirectUri, :string
    field :secret, :string

    timestamps()
  end

  @doc false
  def changeset(%Client{} = client, attrs) do
    client
    |> cast(attrs, [:name, :secret, :redirectUri])
    |> validate_required([:name, :secret, :redirectUri])
  end
end
