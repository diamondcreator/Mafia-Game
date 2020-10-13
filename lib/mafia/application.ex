defmodule Mafia.Application do

  @moduledoc """
    Router da aplicação que incia o servidor websocket e o servidor HTTP
  """

  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Mafia.Router, options: [port: 4041, dispatch: dispatch()]}
    ] 
    opts = [strategy: :one_for_one, name: Mafia.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
    Tabela estática para o servidor cowboy rotear os paths 
  """

  defp dispatch do
    [
      {:_, [
        {"/ws", Mafia.SocketHandler, []},
        {:_, Plug.Cowboy.Handler, {Mafia.Router, []}}
      ]}
    ]
  end

end
