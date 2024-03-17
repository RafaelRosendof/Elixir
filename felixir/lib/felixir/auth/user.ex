defmodule Felixir.Auth.User do
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
    |> validate_length(:username, min: 4 , max: 30)
    |> validate_length(:name , min: 3 , max: 30)
    |> validate_length(:password,min: 8 , max: 30) #Aqui eu chamo uma função que checa o tamanho
    #agora devo realizar as migrações no teminal com o comando mix ecto.migrate
  end
end
