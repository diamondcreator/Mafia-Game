defmodule Mafia.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Mafia.Router, options: [port: 4040, dispatch: dispatch()]}
    ]
    opts = [strategy: :one_for_one, name: Mafia.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tabela estranha né? mas é pra pegar websocket e redirecionar pra outro handler
  # Tabela de matchs do cowboy que vai usar pra redirecionar
  defp dispatch do
    [
      {:_, [
        {"/ws", Mafia.SocketHandler, []},
        {:_, Plug.Cowboy.Handler, {Mafia.Router, []}}
      ]}
    ]
  end

end
