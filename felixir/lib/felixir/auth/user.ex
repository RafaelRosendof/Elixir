defmodule Felixir.Auth.User do
  alias Ecto.Changeset
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :username, :string
    field :password, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :username, :password])
    |> validate_required([:name, :email, :username, :password])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/) #adicionado agorta esse e o de baixo
    |> update_change(:email , fn email ->String.downcase(email)  end)
    |> validate_length(:username, min: 4 , max: 30)
    |> validate_length(:name , min: 3 , max: 30)
    |> validate_length(:password,min: 8 , max: 30) #Aqui eu chamo uma função que checa o tamanho
    #agora devo realizar as migrações no teminal com o comando mix ecto.migrate
    |> hash_password
  end
  defp hash_password(%Ecto.Changeset{} =  changeset) do
   # IO.puts("changeset => ")
  #  IO.inspect(changeset)
  case changeset do
   % Ecto.Changeset{valid?: true , changes: %{password: password}} ->
    IO.inspect(password)
    # esqueçe changeset #isso tbm
   new_changeset = put_change(changeset , :password, Argon2.hash_pwd_salt(password)) #fazer uma rash da senha

   new_changeset
    _ ->
       changeset #comentar isso
  end
    changeset
  end
end
