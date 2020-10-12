defmodule MafiaTest do
  use ExUnit.Case
  doctest Mafia
  
  defp create_players(room, count) do
    if count != 0 do
        plr = Mafia.User.new(count)
        room = Mafia.Room.add_player(room, plr)
        create_players(room, count - 1)
    else
        room
    end
  end
  test "checks 2 mafia players" do
    # cria um owner e a sala
    owner = Mafia.User.new(0)
    room = Mafia.Room.new(0, owner, "Seila po") |> create_players(8)
    assert Map.keys(room.players) |> length == 9

    # inicia o jogo e ve se iniciou certo
    {:ok, room} = room |> Mafia.Room.start_game
    assert room.started
    
    # filtra os keys dos players pra ver quais são mafias
    mafia = Enum.filter(Map.keys(room.players), fn key -> 
      player = Map.fetch!(room.players, key)
      Map.fetch!(player, :class) == 1
    end)

    # se for 2 ta certo!
    assert length(mafia) == 2
  end


  test "every player can vote" do
    # cria um owner e a sala
    owner = Mafia.User.new(0)
    room = Mafia.Room.new(0, owner, "Seila po") |> create_players(8)
    # inicia o jogo e ve se iniciou certo
    {:ok, room} = room |> Mafia.Room.start_game
    assert room.started
    
    # filtra os keys dos players pra ver quais são mafias
    mafia = Enum.filter(Map.keys(room.players), fn key -> 
      room.players[key].class == 1
    end)

    # se for 2 ta certo!
    assert length(mafia) == 2

    # Votos
    {:ok, room} = Mafia.Room.vote_kick(room, 0, 1)
    {:ok, room} = Mafia.Room.vote_kick(room, 1, 2)
    {:ok, room} = Mafia.Room.vote_kick(room, 2, 1)
    {:ok, room} = Mafia.Room.vote_kick(room, 3, 1)
    {:ok, room} = Mafia.Room.vote_kick(room, 4, 1)
    {:ok, room} = Mafia.Room.vote_kick(room, 5, 1)
    {:ok, room} = Mafia.Room.vote_kick(room, 6, 1)
    {:ok, room} = Mafia.Room.vote_kick(room, 7, 1)
    {:ok, room} = Mafia.Room.vote_kick(room, 8, 1)
    {:not_exists, room} = Mafia.Room.vote_kick(room, 9, 1)

    # Faz o turno do dia
    assert Mafia.Room.all_voted(room)
    assert Mafia.Room.check_votes(room) == %{1 => 8, 2 => 1}
    {:eliminated, 1, room} = Mafia.Room.turn(room)
    room = Mafia.Room.reset_votes(room)
   
    assert not Mafia.Room.all_voted(room)
    assert room.turn == 0

    
    dead_ones = room.players |> Enum.filter(fn {_, plr} -> plr.dead end)
    assert length(dead_ones) == 1

    # filtra os keys dos players pra ver quais pode matar
    to_kill = Enum.filter(Map.keys(room.players), fn key -> 
      room.players[key].class == 0 && not room.players[key].dead
    end)
    |> Enum.take_random(2)

    # Pega dois players para matar
    {first, sec} = {Enum.at(to_kill, 0), Enum.at(to_kill, 1)}

    # Não permite que o player mate o outro de noite
    {:cannot_vote, _} = Mafia.Room.vote_kick(room, first, sec)
   
    people_killed = 0

    {killed, room} = Mafia.Room.vote_kick(room, Enum.at(mafia, 0), first)

    people_killed = if killed == :ok do 1 else 0 end

    assert not Mafia.Room.all_mafia_voted?(room)

    {killed, room} = Mafia.Room.vote_kick(room, Enum.at(mafia, 1), sec)

    people_killed = if killed == :ok do people_killed + 1 else people_killed end

    {:cannot_vote_mafia, room} = Mafia.Room.vote_kick(room, Enum.at(mafia, 1), Enum.at(mafia, 0))
    
    assert Mafia.Room.all_mafia_voted?(room)

    {:killed, plrs, room} = Mafia.Room.turn(room)

    assert length(plrs) == people_killed
    
    # Testa quantos players morreram
    dead_ones = room.players |> Enum.filter(fn {_, plr} -> plr.dead end)
    assert length(dead_ones) == people_killed + 1

    # Testa se está de dia
    assert room.turn == 1
  end
end
