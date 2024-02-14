defmodule MyFirstWebServer.Tota do
  use Plug.Router
  plug(:match)
  plug(:dispatch)

  get "/Fala" do
    send_resp(conn , 200 , "Fala figas tudo bom , Talvez...?")
  end

  get "/figas" do
    send_resp(conn , 404 , "Voce aqui dnv? janela errada meu caro!" )
  end

  match _ do
    send_resp(conn , 400 ,"Deu merda denovo!")
  end

end
