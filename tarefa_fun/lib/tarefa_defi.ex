defmodule TarefaDefi do
  # import Decimal

  def calculo_soma(x, erro) do
    soma = Decimal.new(1)
    termo = Decimal.new(1)
    soma_atual = Decimal.add(soma , termo)

    delta = Decimal.abs(Decimal.sub(soma_atual , soma)) 

    i = 1

    iterate_2(termo, soma, i, x, erro,delta)
  end

  defp iterate_2(_termo,soma,_i,_x,erro,delta) when delta - erro > 0 do #when erro > delta 
      soma
    end

  defp iterate_2(termo,soma,i,x,erro,delta) do
     termo_atual = Decimal.mult(termo, Decimal.div(x, i))

    soma_atual = Decimal.add(soma, termo_atual)

    IO.puts("Iteração #{i} com o ERRO #{Decimal.to_string(erro)} A SOMA FICA #{Decimal.to_string(soma)}")
    
    iterate_2(termo_atual,soma_atual,i+1,x,erro,delta)
  end
end


defmodule Main do
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

    #entrar com o numero int e o expoente como variável 
    x = Decimal.new(1, x_input, x_exp) #estava menos 10 ou era -9
    erro = Decimal.new(1, erro_input, erro_exp) #estava -30

    res = TarefaDefi.calculo_soma(x, erro)

    IO.puts("e^x #{Decimal.to_string(x)} = #{Decimal.to_string(res)}")
  end
end

Main.run()
