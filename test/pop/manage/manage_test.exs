defmodule Pop.ManageTest do
  use Pop.DataCase

  alias Pop.Manage

  describe "clients" do
    alias Pop.Manage.Client

    @valid_attrs %{name: "some name", redirectUri: "some redirectUri", secret: "some secret"}
    @update_attrs %{name: "some updated name", redirectUri: "some updated redirectUri", secret: "some updated secret"}
    @invalid_attrs %{name: nil, redirectUri: nil, secret: nil}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manage.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert Manage.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert Manage.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = Manage.create_client(@valid_attrs)
      assert client.name == "some name"
      assert client.redirectUri == "some redirectUri"
      assert client.secret == "some secret"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manage.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = Manage.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.name == "some updated name"
      assert client.redirectUri == "some updated redirectUri"
      assert client.secret == "some updated secret"
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = Manage.update_client(client, @invalid_attrs)
      assert client == Manage.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = Manage.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> Manage.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = Manage.change_client(client)
    end
  end
end
