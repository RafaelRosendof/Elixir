No arquivo router.ex foi adicionado as seguintes linhas 

```elixir

  scope "/api/graphql" do #aqui tbm foi modificado api do graphql(pesquisar sobre o graphql)
    pipe_through :api
    get "/" ,Absinthe.Plug.GraphiQL, schema: FelixirWeb.Schema,
    interface: :playground
    post "/" ,Absinthe.Plug, schema: FelixirWeb.Schema
  end
  ```
  aqui foi para chamar o graphql e colocar uma rota no sistema/server

  '''
mix phx.gen.context Auth User user name email:unique username:unique password
''' #coloquei isso no terminal
#Ao colocar esse comando gerou algo no arquivo user.ex e no arquivo migration.ex ou melhor na pasta migration

#comentar sobre o banco de dados e fazer isso no notebook para fixar melhor

#tem que iniciar o banco de dados, seguir um tutorial no codes for geek eu acho
#https://www.geeksforgeeks.org/how-to-install-postgresql-on-arch-based-linux-distributions-manjaro/

colocar esses detalhes pq está no arquivo router.ex também 

### Arquivo schema.ex

```elixir
defmodule FelixirWeb.Schema do
 use Absinthe.Schema

 @desc "querry"
 query do

  field :hello, :string do
    resolve(fn _, _, _ -> {:ok,"worlds"} end) #foi modificado aqui pesquisar o que é isso né?
  end
 end
end
```
Aqui foi criado esse arquivo para criar essa query, ainda vou pesquisar melhor sobre...

### Arquivo user.ex 
Nesse arquivo me lembro bem que ele foi gerado após passar o comando no terminal pedindo para que o mix fizesse usuário email e senha então ficou tudo meio que descrito como uma struct 

Eu adicionei tbm esse comando aqui para fazer uma validação do nome email e usuário

```elixir
    |> validate_length(:username, min: 4 , max: 30)
    |> validate_length(:name , min: 3 , max: 30)
    |> validate_length(:password,min: 8 , max: 30) #Aqui eu chamo uma função que checa o tamanho
    #agora devo realizar as migrações no teminal com o comando mix ecto.migrate
```
Como fala o comentário eu devo fazer o mix ecto.migrate (Deu problema para dedeu com postgresql)

```Elixir
      {:dns_cluster, "~> 0.1.1"},
      {:bandit, "~> 1.2"},
      {:plug_cowboy, "~>2.7"}, #algumas coisas por aqui também foram adicionadas
      {:absinthe, "~> 1.6.4"},
      {:absinthe_plug , "~> 1.5.8"},#aqui eu adicionei pastas no mix.ex 
``` 

### Arquivo XXXXXXXXX_create_user.ex 
foi quando eu fiz o ecto.migrate e aí foi criado esse arquivo


### Para finalizar por enquanto:

```elixir
config :felixir, Felixir.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost", #isso foi gerado automaticamente
  database: "felixir_dev",
```
Isso foi gerado ao colocar a dependência com o postrgesql
