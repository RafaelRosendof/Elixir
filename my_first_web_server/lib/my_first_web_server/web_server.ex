defmodule MyFirstWebServer.WebServer do

  import Plug.Conn

  def init(options) do
    IO.inspect("plug init")
    options
  end

  def call(conn , _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200,"Hello figas")

  end
end
