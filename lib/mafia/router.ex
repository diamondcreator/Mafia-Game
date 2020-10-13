defmodule Mafia.Router do
  use Plug.Router
  
  require Logger

  plug :match
  plug :dispatch

  forward("/static", to: Mafia.StaticRouter)

  get "*" do
    Logger.debug "Someone entered in the website :O"
    body = EEx.eval_file("priv/static/index.html")
    send_resp(conn,  200, body)
  end 
  
end   