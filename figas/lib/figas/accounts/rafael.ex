defmodule Figas.Accounts.Rafael do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rafael" do
    field :name, :string
    field :age, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(rafael, attrs) do
    rafael
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
