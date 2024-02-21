### Basic Guide to my personal Phoenix aplication 

Here is the first steps:

to create a phx aplication you first need to put the command mix phx.new my_app

Second need to run the databases by mix ecto.migrate, similar with the django framework.

If we want a live aplication we need to put the follow commands:
mix phx.new my_app
mix phx.gen.live Accounts Figas figas name:string age:integer
and then is complete the basic struct of the live aplication
