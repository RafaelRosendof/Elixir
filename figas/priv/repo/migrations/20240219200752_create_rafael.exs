defmodule Figas.Repo.Migrations.CreateRafael do
  use Ecto.Migration

  def change do
    create table(:rafael) do
      add :name, :string
      add :age, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
