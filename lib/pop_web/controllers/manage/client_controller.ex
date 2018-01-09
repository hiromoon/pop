defmodule PopWeb.Manage.ClientController do
  use PopWeb, :controller

  alias Pop.Manage
  alias Pop.Manage.Client

  def index(conn, _params) do
    clients = Manage.list_clients()
    render(conn, "index.html", clients: clients)
  end

  def new(conn, _params) do
    changeset = Manage.change_client(%Client{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"client" => client_params}) do
    case Manage.create_client(client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client created successfully.")
        |> redirect(to: manage_client_path(conn, :show, client))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Manage.get_client!(id)
    render(conn, "show.html", client: client)
  end

  def edit(conn, %{"id" => id}) do
    client = Manage.get_client!(id)
    changeset = Manage.change_client(client)
    render(conn, "edit.html", client: client, changeset: changeset)
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Manage.get_client!(id)

    case Manage.update_client(client, client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client updated successfully.")
        |> redirect(to: manage_client_path(conn, :show, client))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", client: client, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Manage.get_client!(id)
    {:ok, _client} = Manage.delete_client(client)

    conn
    |> put_flash(:info, "Client deleted successfully.")
    |> redirect(to: manage_client_path(conn, :index))
  end
end
