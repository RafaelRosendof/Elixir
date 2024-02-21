defmodule FigasWeb.RafaelLiveTest do
  use FigasWeb.ConnCase

  import Phoenix.LiveViewTest
  import Figas.AccountsFixtures

  @create_attrs %{name: "some name", age: 42}
  @update_attrs %{name: "some updated name", age: 43}
  @invalid_attrs %{name: nil, age: nil}

  defp create_rafael(_) do
    rafael = rafael_fixture()
    %{rafael: rafael}
  end

  describe "Index" do
    setup [:create_rafael]

    test "lists all rafael", %{conn: conn, rafael: rafael} do
      {:ok, _index_live, html} = live(conn, ~p"/rafael")

      assert html =~ "Listing Rafael"
      assert html =~ rafael.name
    end

    test "saves new rafael", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/rafael")

      assert index_live |> element("a", "New Rafael") |> render_click() =~
               "New Rafael"

      assert_patch(index_live, ~p"/rafael/new")

      assert index_live
             |> form("#rafael-form", rafael: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#rafael-form", rafael: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/rafael")

      html = render(index_live)
      assert html =~ "Rafael created successfully"
      assert html =~ "some name"
    end

    test "updates rafael in listing", %{conn: conn, rafael: rafael} do
      {:ok, index_live, _html} = live(conn, ~p"/rafael")

      assert index_live |> element("#rafael-#{rafael.id} a", "Edit") |> render_click() =~
               "Edit Rafael"

      assert_patch(index_live, ~p"/rafael/#{rafael}/edit")

      assert index_live
             |> form("#rafael-form", rafael: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#rafael-form", rafael: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/rafael")

      html = render(index_live)
      assert html =~ "Rafael updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes rafael in listing", %{conn: conn, rafael: rafael} do
      {:ok, index_live, _html} = live(conn, ~p"/rafael")

      assert index_live |> element("#rafael-#{rafael.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#rafael-#{rafael.id}")
    end
  end

  describe "Show" do
    setup [:create_rafael]

    test "displays rafael", %{conn: conn, rafael: rafael} do
      {:ok, _show_live, html} = live(conn, ~p"/rafael/#{rafael}")

      assert html =~ "Show Rafael"
      assert html =~ rafael.name
    end

    test "updates rafael within modal", %{conn: conn, rafael: rafael} do
      {:ok, show_live, _html} = live(conn, ~p"/rafael/#{rafael}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Rafael"

      assert_patch(show_live, ~p"/rafael/#{rafael}/show/edit")

      assert show_live
             |> form("#rafael-form", rafael: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#rafael-form", rafael: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/rafael/#{rafael}")

      html = render(show_live)
      assert html =~ "Rafael updated successfully"
      assert html =~ "some updated name"
    end
  end
end
