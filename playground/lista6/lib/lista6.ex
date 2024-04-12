defmodule Lista6 do
#import List

  def calcular(lista) when is_list(lista) do
    {tamanho , soma} = calcular_tamanho_e_soma(lista)

    media = calcular_media(tamanho , soma)
    [tamanho , soma , media]
  end

  defp calcular_tamanho_e_soma([]) , do: {0,0} #caso receba lista vazia
  defp calcular_tamanho_e_soma([head | tail]) do
    {tamanho , soma} = calcular_tamanho_e_soma(tail) #recursão
    {tamanho + 1 , soma + head} #volta com a lista menor
  end

  defp calcular_media(0,_), do: 0 #caso seja vazio retorne 0
  defp calcular_media(tamanho , soma), do: soma/tamanho #soma / tamanho, básico


  ############################# questão 2
  def transforma(lista) when is_list(lista) do
   #recebe uma lista de numeros em faren
   #devolve essa lista em celcius

    #Perguntar ao professor como que tira essas casa decimais

   converte_f_c(lista)


  end
  defp converte_f_c([]) , do: [] #tratando caso receba nulo
  defp converte_f_c([head | tail]) do
  #recebe a lista e passa para a função que converte c para f
    [conversor(head) | converte_f_c(tail)]
  end

  defp conversor(farenheint) do
    celcius = (farenheint - 32) * 5 / 9
    celcius
  end

  ###Questão 3 ######################

  def function_zip(listas) when is_list(listas) do
   #função zip (recebe uma lista de listas e cria uma lista de listas contendo cada elemento de cada posição )

   #Pode fazer uma abordagem preguiçosa?

   zip(listas , 0)
  end

  defp zip(listas , index) do
    #Fazer o map dessa lista pegando o primeiro indice
    Enum.map(listas , &extrair(&1 , index))
  end

  defp extrair(lista , index) do
    Enum.at(lista , index)
  end


  def func_take(0 , _quantos), do : []
    #recebe quantos e devolve a quantidade de quantos da lista
  def func_take(_,[]), do: []
  def func_take(n , [head | tail]) when n > 0 do
    [head | take(n-1 , tail)]
  end
  def func_take(n , quantos) when is_integer(quantos) do
    func_take(n, 1..quantos)
  end


  '''
defmodule MinhasFuncoes do
  def take(0, _sequence), do: []
  def take(_, []), do: []
  def take(n, [head | tail]) when n > 0 do
    [head | take(n - 1, tail)]
  end

  def take(n, sequence) when is_integer(sequence) do
    take(n, 1..sequence)
  end
end

'''

  #quest
end

