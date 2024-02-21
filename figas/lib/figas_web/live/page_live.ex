# lib/figas_web/live/page_live.ex

defmodule FigasWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    html_path = "/home/rafael/Elixir_projects/figas/lib/figas_web/templates/page.html.eex"
    ~H"""
    <div>
      <h1>Figas testando</h1>
      <!-- Your LiveView content here -->
    </div>
    """
  end
  #Tentar carregar o html aqui.

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
