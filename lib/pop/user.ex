defmodule Pop.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "users" do
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password])
    |> validate_required([:name, :password])
  end

  @doc false
  def list() do
    Repo.all(User)
  end

  @doc false
  def get(name) do
    Repo.get_by!(__MODULE__, name: name)
  end

  @doc false
  def create(attrs) do
    __MODULE__
    |> changeset(attrs)
    |> Repo.insert!()
  end

  @doc false
  def update(attrs) do
    __MODULE__
    |> changeset(attrs)
    |> Repo.update()
  end

  @doc false
  def delete(name) do
    __MODULE__
    |> changeset(name: name)
    |> Repo.delete!()
  end
end
