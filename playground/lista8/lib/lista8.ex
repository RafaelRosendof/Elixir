defmodule Lista8 do

  def mdc(0,b) , do: b
  def mdc(a,0) , do: a

  def mdc(a , b) do
    mdc(b, rem(a,b))
  end


  def primo_bool(0) , do: false

  def primo_bool(x) do
    primo_bool(x,x-1)
  end

  defp primo_bool(_,1) , do: true
  defp primo_bool(x,div) when rem(x , div) == 0 , do: false
  defp primo_bool(x, div) , do: primo_bool(x, div - 1)



  def perfeito(0) , do: false

  def perfeito(x) do
   fatores = fatora(x)
    soma_fatores = Enum.sum(fatores)
    soma_fatores == x
  end

  defp fatora(x) do
    1..(x-1)
    |> Enum.filter(&rem(x, &1) == 0)
  end

  def abundante(0) , do: true

  def abundante(x) do
    fatores = fatora(x)
    soma_fatores = Enum.sum(fatores)
    soma_fatores > x
  end

  def amigos(0,b) , do: false
  def amigos(a,0) , do: false

  def amigos(a,b) do
    fatores_a = fatora(a)  #fatores de 220
    fatores_b = fatora(b)  #fatores de 284
    soma_a = Enum.sum(fatores_a) #soma a = fatores de b
    soma_b = Enum.sum(fatores_b) #soma b = fatores de a

    soma_a == b
    soma_b == a

  end

  def sumHarmonic(x) when x <= 1 , do: 1.0 #caso base

  def sumHarmonic(x) when is_integer(x) and x > 1 do
    sumHarmonic(x-1) + (1.0 / x)
  end

  #continuando da 7 agora

  def iSort([]) , do: [ ]

  def iSort(l) when is_list(l) do
    [head | tail] = l
    insert(head , iSort(tail))
  end

  defp insert(x,[]) , do: [x]

  defp insert(x , [h | t]) when x <= h , do:  [x | [h | t]]

  defp insert(x , [h | t]) , do: [h | insert(x,t)]


  #fazendo a questão 8

  def minFigas(x) when is_list(x) do
    sorted = iSort(x)
    hd(sorted)
  end

  def maxFigas(x) when is_list(x) do
   sorted = iSort(x)
   IO.puts(tl(x)) #era para printar o tail
  end


  #pulando para a questão 9
  #fazer essas duas implementando o método Enum.max e Enum.min
  def minList(x) when is_list(x) do
    menor = Enum.min(x)
  end

  def maxList(x) when is_list(x) do
    maior = Enum.max(x)
  end



  #continuando para a 10

  defp insert_cont(x,[]) , do: [x]
  defp insert_cont(x , [h | t]) when x >= h , do: [h | [x | t]]
  defp insert_cont(x , [h | t]) , do: [h | insert_cont(x,t)]

  def sort_cont([]) , do: [ ]
  def sort_cont(l) when is_list(l) do
    [head | tail] = l
    insert_cont(head , sort_cont(tail))

  end


end
