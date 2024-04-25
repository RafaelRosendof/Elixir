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
  def iSort([]) , do: [] 
  def iSort(h) when is_list(h) do
    
  end 

  # defp insert(x,l) when is_list(l) and l = [] , do: []
  # defp insert(x , l) when  is_list(l) and x <= h do  #caso [h|t] and x <=h
    
  # end 

  # defp insert(x ,l) when is_list(l) #tendi mais nada 


  #pulando para a questão 9 
  #fazer essas duas implementando o método Enum.max e Enum.min
  def minList(x) when is_list(x) do
    menor = Enum.min(x)
  end

  def maxList(x) when is_list(x) do
    maior = Enum.max(x)
  end

  def duce([]) , do: [] 
  def duce(x) when is_list(x) do
    Enum.reduce(x , [] , fn x , acc -> if x in acc , do: acc , else: [x | acc] end)
  end

  def refilter([]) , do: []
  
  def refilter(x) when is_list(x) do
    Enum.filter(x , fn(a) -> rem(a,2) == 0 end)
  end

  #partindo para a 13

  def squareAll([]) , do: []
  def squareAll(x) when is_list(x) do
    Enum.map(x , fn(figas) -> figas*figas end)
  end

  def nestedReverse([]) , do: []
  def nestedReverse(x) when is_list(x) do
   Enum.map(x , fn palavra -> Enum.reverse(palavra) end) 
  end

  def nested_reverse([]), do: []
  def nested_reverse(list) when is_list(list) do
    Enum.map(list, fn words ->
      Enum.map(words, fn word ->
        Enum.reverse(word)
      end)
    end)
  end

  def atFront([]) , do: []
  def atFront(x) when is_list(x) do
    #  // [head | tail] 

  end

 #ou seria 
  def atFront([head | tail]) do
    Enum.map() #aplica o tail em todas as sublistas. 
  end

end 
