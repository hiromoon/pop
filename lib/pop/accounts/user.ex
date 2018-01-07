defmodule Pop.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pop.Accounts.User


  schema "users" do
    field :email, :string
    field :password, :string
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:user_id, :email, :password])
    |> validate_required([:user_id, :email, :password])
  end
end
