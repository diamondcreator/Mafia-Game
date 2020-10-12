defmodule Mafia.SocketHandler do
  @behaviour :cowboy_websocket
 
  def init(request, _state) do
    {:cowboy_websocket, request, []}
  end

  def websocket_init(state) do
    {:ok, state}
  end

  def websocket_handle({:text, json}, state) do
    IO.inspect json
    {:reply, {:text, json}, state}
  end

  def websocket_info(info, state) do
    {:reply, {:text, info}, state}
  end

end