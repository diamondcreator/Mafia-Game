
defmodule Mafia.Room do 

    @moduledoc """
    Esse módulo serve para a especificação de uma instancia de jogo. Ele contem
    Todas informações necessárias para uma partida completa    
    """

    @enforce_keys [:id, :ownerId]

    defstruct [:count, :id, :name, :started, :password, :capacity, :players, :ownerId, :players_count, :turn]

    def new(id, owner, name, password \\ nil) do
        %__MODULE__{
            id: id,
            name: name,
            ownerId: owner.id,
            password: password,
            started: false,
            count: 1,
            players: %{owner.id => owner},
            players_count: 1,
            turn: 1,
        }
    end

    @doc """
        Inicia a partida
    """

    def start_game(room) do
        if room.players_count < 4 do
            {:unsuficient_players, room}
        else
            room = room
            |> raffle_players
            |> Map.put(:started, true)
            {:ok, room}
        end
    end

    @doc """
        Iniciar votação para kickar do jogo
    """

    def vote_kick(room, player, playerid) do
        player_to_kick = Map.get(room.players, playerid)
        player_that_voted = Map.get(room.players, player)

        cond do
            player == playerid ->
                {:same_person, room}
            player_to_kick == nil or player_that_voted == nil ->
                {:not_exists, room}
            player_to_kick.dead ->
                {:voting_already_dead, room}
            player_that_voted.dead ->
                {:player_already_dead, room}
            true ->
                player_that_voted = Map.put(player_that_voted, :voted, player_to_kick.id)    
                players = room.players
                |> Map.put(player_that_voted.id, player_that_voted)    
                {:ok, Map.put(room, :players, players)}
        end
    end

    @doc """
        Checa a quantidade de votos e retorna a quantidade que cada um recebeu
    """

    def check_votes(room) do 
        room.players
        |> Enum.filter(fn {_, plr} -> not plr.dead end)
        |> Enum.frequencies_by(fn {_, plr} -> plr.voted end) 
    end

    @doc """
        Reseta todos os votos 
    """

    def reset_votes(room) do
        players = Enum.map(room.players, fn {id, player} ->  
            {id, Map.put(player, :voted , nil)}
        end) |> Map.new
        Map.put(room, :players, players)
    end 

    @doc """
        Removes a player from the room
    """
    
    def all_voted(room) do
        room.players
        |> Enum.filter(fn {_, plr} -> not plr.dead end)
        |> Enum.all?(fn {_, plr} -> plr.voted != nil end)
    end
    
    def rem_player(room, playerid) do
        players = Map.delete(room.players, playerid)
        new_room = room
        |> Map.put(:players, players)
        |> Map.put(:players_count, room.players_count - 1)
    end

    @doc """
        Adiciona um player na partida
    """

    def add_player(room, player) do
        players = Map.put(room.players, player.id, player)
        new_room = Map.put(room, :count, room.count + 1) 
        |> Map.put(:players, players)
        |> Map.put(:players_count, room.players_count + 1)
    end

    @doc """
        Transforma o dia em noite
    """

    defp turn_day(room) do
        # verifica quem o Mafia votou
    end

    defp turn_night(room) do
        # verifica quem as pessoas votaram
        # remove
        minimum = trunc(floor(room.players_count/2))
        [{id, num} | tail] = check_votes(room) |> Enum.sort(fn {_, valueone},{_, valuetwo} -> valueone >= valuetwo end) 
        [{_, num2} | _] = tail
        if num != num2 and num >= minimum do
            player = Map.put(room.players[id], :dead, true)
            {:eliminated, id, Map.put(room, :players, Map.put(room.players, id, player))}
        else
            {:no_one, room}
        end
    end

    def turn(room) do
        if room.turn == 0 do
            turn_day(room)
        else
            turn_night(room)
        end
    end

    @doc """
        Sorteia os mafias para a partida
    """

    defp raffle_players(room) do 
        mafia_num = trunc(floor(room.players_count/4))

        # Aqui ele seleciona 2 KEYS do map como mafia em list
        mafia = room.players
        |> Map.keys
        |> Enum.take_random(mafia_num)
    
        # Coloca como class = 1 no room.players sendo "room.players" o retorno
        new_players = Enum.reduce(mafia, room.players, fn current, acc -> 
            new_player = Map.get(room.players, current) |> Map.put(:class, 1)   
            Map.put(acc, current, new_player)
        end)

        Map.put(room, :players, new_players)
    end
    
end