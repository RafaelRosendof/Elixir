defmodule FelixirWeb.Schema.Resolvers.UserResolver do
  alias Felixir.Auth
  alias FelixirWeb.Utils
  alias FelixirWeb.Constants
  def register_user(_, %{input: input}, _)do #colocando uma map aqui
  #case Auth.create_user(input) do
   # {:ok , _}->
  #    {:ok , true}

  #  {:error, %Ecto.Changeset{} = changeset} ->
  #    errors= Utils.format_changeset_errors(changeset)
  #    {:error,erros}

 #     {_ , _} -> {:error , Constants.internal_server_error()}
 # end

 IO.inspect(input)
 res = Auth.create_user(input)
 IO.puts("create_user res => ")
 IO.inspect(res)
 {:ok , true}
  end

end
