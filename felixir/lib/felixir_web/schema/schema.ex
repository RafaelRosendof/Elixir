defmodule FelixirWeb.Schema do
 use Absinthe.Schema
  import_types(FelixirWeb.Schema.Types) #veja se ponto isso mesmo

  alias FelixirWeb.Schema.Resolvers

 @desc "querry"
 query do

  field :hello, :string do
    resolve(fn _, _, _ -> {:ok,"worlds"} end) #foi modificado aqui pesquisar o que é isso né?
  end
 end

# @desc "Get all Users"
 #   field :users, list_of(:user_type) do
 #     resolve(&Resolvers.UserResolver.get_all_users/3)
 #   end
 mutation do
   field :register_user, :boolean do
    arg(:input, non_null(:registration_input_type))
    resolve(&Resolvers.UserResolver.register_user/3)

   end
 end
end

#comentar algo mais explicativo, de tudo que vc fez até agora....
