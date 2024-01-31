defmodule MyFirstWebServer.WebServer2 do
 use Plug.Router
 plug(:match)
 plug(:dispatch)

 get "/hello" do
  send_resp(conn , 200 , "Ta aqui dnv?")
 end

get "/hello2" do
  send_resp(conn , 200 , "Eai meu caro?")
end

 match _ do
  send_resp(conn , 400 ,"Deu merda denovo!")
 end
end

#Como que eu coloco os métodos get na primeira porta???????
