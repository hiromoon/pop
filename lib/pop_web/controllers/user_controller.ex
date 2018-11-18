defmodule PopWeb.UserController do
  use PopWeb, :controller

  def index(conn, _params) do
    users = Pop.User.list()
    json(conn, users)
  end

  def create(conn, _params) do
    user = Pop.User.create()
    json(conn, user)
  end

  def detail(conn, params) do
    user = Pop.User.get(params["name"])
    json(conn, user)
  end

  def update(conn, params) do
    user = Pop.User.udpate()
    json(conn, user)
  end

  def delete(conn, params) do
    user = Pop.User.delete(params["name"])
    json(conn, user)
  end
end
