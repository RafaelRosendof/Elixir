defmodule FelixirWeb.Schema do
 use Absinthe.Schema

 @desc "querry"
 query do

  field :hello, :string do
    resolve(fn _, _, _ -> {:ok,"worlds"} end) #foi modificado aqui pesquisar o que é isso né?
  end
 end
end

#comentar algo mais explicativo, de tudo que vc fez até agora....
