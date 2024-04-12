defmodule TesteAulaTest do
  use ExUnit.Case
  doctest TesteAula

  test "greets the world" do
    assert TesteAula.hello() == :world
  end
end
