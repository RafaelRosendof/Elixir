# MyFirstWebServer

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `my_first_web_server` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:my_first_web_server, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/my_first_web_server>.


Vou colocar aqui algumas notas para poder me orientar postumamente

Como começar, primeiro o comando usado para criar uma pasta operável assim como é o cargo do rust é usando o comando mix new "nome da pasta"/n
Aṕos criado a pasta eu abro uma outra pasta chamada my_first_web_server dentro de lib e coloco um arquivo chamado web_server.ex e nisso eu coloco todo o código que está dentro dele, para checar o código e a explicação basta acessar o código com os comentários.

Para rodar o servidor basta colocar iex -S mix e com isso digitar o comando {:ok , _pid} = Plug.Cowboy.http(MyfirstWebServer.WebServer, []) e entrar no http://localhost:4000 e para desligar basta colocar Plug Cowboy shutdow(MyfirstWebServer.WebServer.HTTP) e ai matamos o servidor e podemos dar um comando de :observer.start() para ver os status do server