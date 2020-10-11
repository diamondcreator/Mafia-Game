defmodule Mafia.User do

    @moduledoc """
        Esse modulo serve especificar um jogador.
        Contém todas as informações de um jogador!
    """

    @enforce_keys [:id, :token]

    defstruct [:id, :token, :class, :dead, :voted]

    def new(id) do
        %__MODULE__{
            id: id,
            token: UUID.uuid4(),
            class: 0,
            dead: false,
            voted: nil
        }  
    end
end