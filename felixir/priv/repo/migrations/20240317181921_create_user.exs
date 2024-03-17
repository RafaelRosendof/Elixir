defmodule Felixir.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :email, :string
      add :username, :string
      add :password, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:user, [:username])
    create unique_index(:user, [:email])
  end
end
