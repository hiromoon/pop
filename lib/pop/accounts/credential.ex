defmodule Pop.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pop.Accounts.{Credential, User}


  schema "credentials" do
    field :email, :string
    field :password, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Credential{} = credential, attrs) do
    credential
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
    |> put_change(:password, Comeonin.Bcrypt.hashpwsalt(attrs["password"]))
  end
end
