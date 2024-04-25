defmodule Lista do
  import Decimal

  IO.puts("Problema 6 da lista \n\n")

  def recebe do
    IO.puts("Digite o X:")
    x_input = String.trim(IO.gets(""))

    IO.puts("Digite o erro:")
    erro_input = String.trim(IO.gets(""))

    x_decimal = Decimal.new(x_input)
    erro_decimal = Decimal.new(erro_input)

    {x_decimal, erro_decimal}
  end

  def alg_natural(x_decimal , erro_decimal) do
    
  end

  #  def printa(x_decimal, erro_decimal) do
  #  IO.puts("\n\n X é #{x_decimal}")
  #  IO.puts(" e o erro inferido é #{erro_decimal}")
  #end
end

