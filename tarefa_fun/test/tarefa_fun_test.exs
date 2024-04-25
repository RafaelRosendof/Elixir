defmodule TarefaFunTest do
  use ExUnit.Case
  doctest TarefaFun

  test "greets the world" do
    assert TarefaFun.hello() == :world
  end
end
