defmodule TarefaFun do
  import Decimal

  def calculo_soma(x, erro) do
    soma = Decimal.new(1)
    termo = Decimal.new(1)

    i = 1

    iterate(termo, soma, i, x, erro)
  end

  defp iterate(termo, soma, i, x, erro) do #aqui tinha Decimal.new(i)
    termo_atual = Decimal.mult(termo, Decimal.div(x, i))

    soma_atual = Decimal.add(soma, termo_atual)

    IO.puts("Iteração #{i} com o ERRO #{Decimal.to_string(erro)} A SOMA FICA #{Decimal.to_string(soma)}")

    if Decimal.abs(Decimal.sub(soma_atual, soma)) <= erro do
      soma_atual
      
    else
      iterate(termo_atual,soma_atual,i+1,x,erro)

    end
  end
end

defmodule Main do
  def run do
    IO.puts("Digite o valor de x (entre 0 e 1): ")
    x_input = IO.gets("")
    |> String.trim()
    |> String.to_float()

    IO.puts("Digite o erro: ")
    erro_input = IO.gets("")
    |> String.trim()
    |> String.to_float()

    x_coef = trunc( x_input * 1_000)
    erro_coef = trunc(erro_input * 10_000_000_000_000_000)


    x = Decimal.new(1, x_coef, -10)
    erro = Decimal.new(1, erro_coef, -30)

    res = TarefaFun.calculo_soma(x, erro)

    IO.puts("e^x #{Decimal.to_string(x)} = #{Decimal.to_string(res)}")
  end
end

Main.run()

