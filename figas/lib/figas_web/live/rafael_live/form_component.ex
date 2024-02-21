defmodule FigasWeb.RafaelLive.FormComponent do
  use FigasWeb, :live_component

  alias Figas.Accounts

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage rafael records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="rafael-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:age]} type="number" label="Age" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Rafael</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{rafael: rafael} = assigns, socket) do
    changeset = Accounts.change_rafael(rafael)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"rafael" => rafael_params}, socket) do
    changeset =
      socket.assigns.rafael
      |> Accounts.change_rafael(rafael_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"rafael" => rafael_params}, socket) do
    save_rafael(socket, socket.assigns.action, rafael_params)
  end

  defp save_rafael(socket, :edit, rafael_params) do
    case Accounts.update_rafael(socket.assigns.rafael, rafael_params) do
      {:ok, rafael} ->
        notify_parent({:saved, rafael})

        {:noreply,
         socket
         |> put_flash(:info, "Rafael updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_rafael(socket, :new, rafael_params) do
    case Accounts.create_rafael(rafael_params) do
      {:ok, rafael} ->
        notify_parent({:saved, rafael})

        {:noreply,
         socket
         |> put_flash(:info, "Rafael created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
