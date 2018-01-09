defmodule Pop.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :secret, :string
      add :redirectUri, :string

      timestamps()
    end

  end
end
