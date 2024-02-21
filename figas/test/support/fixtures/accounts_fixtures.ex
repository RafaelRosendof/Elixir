defmodule Figas.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Figas.Accounts` context.
  """

  @doc """
  Generate a rafael.
  """
  def rafael_fixture(attrs \\ %{}) do
    {:ok, rafael} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> Figas.Accounts.create_rafael()

    rafael
  end
end
