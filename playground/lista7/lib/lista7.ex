defmodule Lista7 do

  def separa(0) , do: []
  def separa(numero) do
    ultimo_digito = rem(numero , 10)
    resto = div(numero , 10)
    [ultimo_digito | separa(resto)] 
  end
  
  def separa_negs(0) , do: []
  def separa_negs(numero) when numero > 0 do

    separa_negs(numero * -1)
    end
  def separa_negs(numero) do 
    ultimo_digito = rem(numero , 10)
    resto = div(numero,10)
    [ultimo_digito | separa_negs(resto)]
  end

  def separa_string("") , do: []
  def separa_string(string) do
    #transformar string em lista e separar os itens 
    [word | resto] = separa_word(string)

    #concatenando 
    [word | separa_string(resto)]

  end

  defp split_word(""), do: ["", ""]
  defp split_word(" " <> rest) , do: ["" , rest]
  defp split_word(string) do
    space_index = String.index_of(string , " ")
    case space_index do
      nil -> [string, ""]

        index -> [String.slice(string, 0..(index - 1)) , String.slice(string (index + 1)..-1)]
    end
  end
end

'''
defmodule utilidades do

  #como percorrer uma lista sem usar Enum.map
  def percorrer([]) , do: :ok
  def percorrer([head | tail])do
    #aqui dentro fazemos algo com o head
    IO.inspect(head)
    #agora chamamos recursivamente a função com o tail
    percorrer(tail)
  end

  #Como usar a recursão para separar elementos de uma lista
  #aqui vou fazer uma função para separar numeros primos e pares de uma lista

  def separa([], pares , impares) , do: {pares , impares}
  def separa([head | tail] , pares , impares) when rem(head , 2) == 0 do
    #aqui eu chamo recursivamente a função com a cauda no meio uma lista de cabeças e pares e dps os impares
    separa(tail , [head , pares], impares)
  end
  def separa([head | tail] , pares , impares) do
    separa(tail , pares , [head | impares])
  end

  #Como somar os elementos de uma lista (sem usar modulos já prontos)
  def somatorio([]) , do: 0
  def somatorio([head | tail]) do
    head + somatorio(tail)
  end

  #separar digitos usando recursividade

  def separa_digits(0) , do: []

  def separa_digits(numero) do
    last_digits = rem(numero , 10)
    resto_numero = div(numero , 10)
    [last_digits | separa_digits(resto_numero)]
  end
end
'''
