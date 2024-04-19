defmodule FelixirWeb.Utils.Utils do
  import Ecto.Changeset
  def format_changeset_errors(%Ecto.Changeset{} = changeset) do
    errors =
      traverse_errors(changeset, fn {msg, opts} ->
        Enum.reduce(opts, msg, fn {key, value}, acc ->
          String.replace(acc, "%{#{key}}", to_string(value))
        end)
      end)

    formatted_errors =
      Enum.map(errors, fn {key, value} ->
        formatted_error = "#{key} #{value}"
        formatted_error
      end) #função para tratamento de erro e exibiçao dos erros, comentar tudo isso dps

    formatted_errors
  end
end
