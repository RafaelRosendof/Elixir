defmodule Do_Math do
 def divide(x,y) when y != 0 do
    {:ok , x / y}
 end
  def divide(_,0) do
    {:erro ,:Deu_merda}
  end
end

case Do_Math.divide(10,5) do
  {:ok , result} -> IO.puts("Resultado é: #{result}")
  
  {:erro , :Deu_merda} -> IO.puts("Erro: Deu_merda ")
end
