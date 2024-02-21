defmodule FigasWeb.RafaelLive.Show do
  use FigasWeb, :live_view

  alias Figas.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:rafael, Accounts.get_rafael!(id))}
  end

  defp page_title(:show), do: "Show Rafael"
  defp page_title(:edit), do: "Edit Rafael"
end
