defmodule Nats do
  def print(1) , do: IO.puts(1)

  def print(n) do
    cond do
      n > 0 ->
        IO.puts(n)
        print(n-1)

        n < 0 ->
          IO.puts(n)
         # true ->
          print(n+1)
    end
  end
end
