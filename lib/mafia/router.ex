defmodule Mafia.Router do
  use Plug.Router
  
  require Logger

  plug :match
  plug :dispatch

  forward("/static", to: Mafia.StaticRouter)

  get "/" do
    Logger.debug "Someone entered in the website :O"
    send_resp(conn, 200, "Welcome")
  end 

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end   