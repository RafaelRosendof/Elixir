defmodule FigasWeb.RafaelLive.Index do
  use FigasWeb, :live_view

  alias Figas.Accounts
  alias Figas.Accounts.Rafael

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :rafael_collection, Accounts.list_rafael())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Rafael")
    |> assign(:rafael, Accounts.get_rafael!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Rafael")
    |> assign(:rafael, %Rafael{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Rafael")
    |> assign(:rafael, nil)
  end

  @impl true
  def handle_info({FigasWeb.RafaelLive.FormComponent, {:saved, rafael}}, socket) do
    {:noreply, stream_insert(socket, :rafael_collection, rafael)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    rafael = Accounts.get_rafael!(id)
    {:ok, _} = Accounts.delete_rafael(rafael)

    {:noreply, stream_delete(socket, :rafael_collection, rafael)}
  end
end
