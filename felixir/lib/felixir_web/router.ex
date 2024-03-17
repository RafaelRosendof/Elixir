defmodule FelixirWeb.Router do
  use FelixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/graphql" do #aqui tbm foi modificado api do graphql(pesquisar sobre o graphql)
    pipe_through :api
    get "/" ,Absinthe.Plug.GraphiQL, schema: FelixirWeb.Schema,
    interface: :playground
    post "/" ,Absinthe.Plug, schema: FelixirWeb.Schema
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:felixir, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: FelixirWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

'''
mix phx.gen.context Auth User user name email:unique username:unique password
''' #coloquei isso no terminal
#Ao colocar esse comando gerou algo no arquivo user.ex e no arquivo migration.ex ou melhor na pasta migration

#comentar sobre o banco de dados e fazer isso no notebook para fixar melhor

#tem que iniciar o banco de dados, seguir um tutorial no codes for geek eu acho
#https://www.geeksforgeeks.org/how-to-install-postgresql-on-arch-based-linux-distributions-manjaro/
