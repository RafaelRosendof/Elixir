defmodule Figas.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Figas.Repo

  alias Figas.Accounts.Rafael

  @doc """
  Returns the list of rafael.

  ## Examples

      iex> list_rafael()
      [%Rafael{}, ...]

  """
  def list_rafael do
    Repo.all(Rafael)
  end

  @doc """
  Gets a single rafael.

  Raises `Ecto.NoResultsError` if the Rafael does not exist.

  ## Examples

      iex> get_rafael!(123)
      %Rafael{}

      iex> get_rafael!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rafael!(id), do: Repo.get!(Rafael, id)

  @doc """
  Creates a rafael.

  ## Examples

      iex> create_rafael(%{field: value})
      {:ok, %Rafael{}}

      iex> create_rafael(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rafael(attrs \\ %{}) do
    %Rafael{}
    |> Rafael.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rafael.

  ## Examples

      iex> update_rafael(rafael, %{field: new_value})
      {:ok, %Rafael{}}

      iex> update_rafael(rafael, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rafael(%Rafael{} = rafael, attrs) do
    rafael
    |> Rafael.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a rafael.

  ## Examples

      iex> delete_rafael(rafael)
      {:ok, %Rafael{}}

      iex> delete_rafael(rafael)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rafael(%Rafael{} = rafael) do
    Repo.delete(rafael)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rafael changes.

  ## Examples

      iex> change_rafael(rafael)
      %Ecto.Changeset{data: %Rafael{}}

  """
  def change_rafael(%Rafael{} = rafael, attrs \\ %{}) do
    Rafael.changeset(rafael, attrs)
  end
end
