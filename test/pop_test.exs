defmodule PopTest do
  use ExUnit.Case
  doctest Pop

  test "greets the world" do
    assert Pop.hello() == :world
  end
end
