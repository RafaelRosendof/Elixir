defmodule Pipe do
  list = [3,2,4,5,6,7,8,1,2,10]

  resultado = list
  |> Enum.map(&(&1 * 2))
  |> Enum.filter(&(&1 > 10))
  |> Enum.sum()
  IO.puts(resultado)
end
