defmodule TesteAula do

  def factory(n , lista) when is_list (lista) do
    Enum.map([lista] ,fn x -> x*n end)
  end
end

defmodule Main do
  IO.puts("Coloque o n: ")
  n = IO.gets("")

  lista = [1,2,3,4,5]

  TesteAula.factory(5,lista)

  IO.puts(lista)
end
