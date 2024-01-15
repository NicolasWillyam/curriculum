defmodule PokelixirTest do
  use ExUnit.Case
  doctest Pokelixir

  test "greets the world" do
    assert Pokelixir.hello() == :world
  end
end
