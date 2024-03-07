defmodule List_Len do
  def list(lista) , do: list(lista , 0)

  defp list([] , count) , do: count
  defp list([_ | tail], count) , do: list(tail , count + 1)
end

defmodule Com_Enum do

  Enum.each([1,2,3] , fn x -> IO.puts(x) end)
 end 

defmodule Map_Enum do
  Enum.map([1,2,3,4], fn x -> x**2 end)
end
defmodule Map_Com do
  Enum.map([1,2,3,4] , &(2 * &1) )
end
