defmodule Figas.AccountsTest do
  use Figas.DataCase

  alias Figas.Accounts

  describe "rafael" do
    alias Figas.Accounts.Rafael

    import Figas.AccountsFixtures

    @invalid_attrs %{name: nil, age: nil}

    test "list_rafael/0 returns all rafael" do
      rafael = rafael_fixture()
      assert Accounts.list_rafael() == [rafael]
    end

    test "get_rafael!/1 returns the rafael with given id" do
      rafael = rafael_fixture()
      assert Accounts.get_rafael!(rafael.id) == rafael
    end

    test "create_rafael/1 with valid data creates a rafael" do
      valid_attrs = %{name: "some name", age: 42}

      assert {:ok, %Rafael{} = rafael} = Accounts.create_rafael(valid_attrs)
      assert rafael.name == "some name"
      assert rafael.age == 42
    end

    test "create_rafael/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_rafael(@invalid_attrs)
    end

    test "update_rafael/2 with valid data updates the rafael" do
      rafael = rafael_fixture()
      update_attrs = %{name: "some updated name", age: 43}

      assert {:ok, %Rafael{} = rafael} = Accounts.update_rafael(rafael, update_attrs)
      assert rafael.name == "some updated name"
      assert rafael.age == 43
    end

    test "update_rafael/2 with invalid data returns error changeset" do
      rafael = rafael_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_rafael(rafael, @invalid_attrs)
      assert rafael == Accounts.get_rafael!(rafael.id)
    end

    test "delete_rafael/1 deletes the rafael" do
      rafael = rafael_fixture()
      assert {:ok, %Rafael{}} = Accounts.delete_rafael(rafael)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_rafael!(rafael.id) end
    end

    test "change_rafael/1 returns a rafael changeset" do
      rafael = rafael_fixture()
      assert %Ecto.Changeset{} = Accounts.change_rafael(rafael)
    end
  end
end
