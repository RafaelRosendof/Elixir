#Modulos e funções

#modulos são em palavras abertas uma classe em elixir que pode abrigar funções e métodos

defmodule Figas do
  def soma(a , b) do

    c = a+b
    IO.puts c
  end

 # multi = fn a,b -> IO.puts a*b end
end

Figas.soma(30 , 100)
IO.puts("\n")

multi = fn a,b -> a*b end

IO.puts multi.(30, 100)
