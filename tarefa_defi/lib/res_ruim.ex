defmodule TarefaRuim do
  #import Decimal

    def calculo_soma(x, erro) do
      soma = Decimal.new(1)
      termo = Decimal.new(1)

      i = 1

      iterate(termo, soma, i, x, erro)
    end
  
   defp iterate(termo, soma, i, x, erro) do #when
   termo_atual = Decimal.mult(termo, Decimal.div(x, i))

    soma_atual = Decimal.add(soma, termo_atual)

   IO.puts("Iteração #{i} com o ERRO #{Decimal.to_string(erro)} A SOMA FICA #{Decimal.to_string(soma)}")
#
   #when erro > termo do soma ou seja retorna a soma j
   if Decimal.abs(Decimal.sub(soma_atual, soma)) <= erro do
     soma_atual

#     #when erro < termo do repete a função aí iterate no caso em cima segui o papel como referência
   else
     iterate(termo_atual,soma_atual,i+1,x,erro)
#
   end
  end
end

defmodule Main_ruim do
    def run do
   IO.puts("Digite o valor da mantissa do X variando de 1 até n (OBS: o X deve estar entre 0 e 1 portanto lembre-se de ajustar o expoente): ")
   x_input = IO.gets("")
   |> String.trim()
   |> String.to_integer()

   IO.puts("Digite o valor do expoente do valor X:  ")
   x_exp = IO.gets("")
   |> String.trim()
   |> String.to_integer()

   IO.puts("Digite a mantissa do erro (Obrigatoriamente digite um número inteiro) : ")
   erro_input = IO.gets("")
   |> String.trim()
   |> String.to_integer()

   IO.puts("Digite o expoente do erro (Como um inteiro, -20 é um bom número): ")
   erro_exp = IO.gets("")
   |> String.trim()
   |> String.to_integer()


   x = Decimal.new(1, x_input, x_exp) #estava menos 10 ou era -9
   erro = Decimal.new(1, erro_input, erro_exp) #estava -30

   res = TarefaRuim.calculo_soma(x, erro)

    IO.puts("e^x #{Decimal.to_string(x)} = #{Decimal.to_string(res)}")
  end
end

Main_ruim.run()
