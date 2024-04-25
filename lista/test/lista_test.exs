defmodule ListaTest do
  use ExUnit.Case
  doctest Lista

  test "greets the world" do
    assert Lista.hello() == :world
  end
end
