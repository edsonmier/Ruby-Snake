module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position(state)
        # verificar que la siguiente casilla sea valida
        if position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else
        end_game(state)
        end
        # si no es valida, entonces el juego termina.
        # si es valida, se mueve la serpiente.
    end

    private

    def calc_next_position(state)
        current_position = state.snake.positions.first

        case state.next_direction
        when UP = :up
            # decrementar fila
            return Model::Coord.new(new_position.row - 1, new_position.column)
        when RIGHT = :right
            # incrementar columna
            return Model::Coord.new(new_position.row, new_position.column + 1)
        when DOWN = :down
            # incrementar fila
            return Model::Coord.new(new_position.row + 1, new_position.column)
        when LEFT = :left
            # decrementar columna 
            return Model::Coord.new(new_position.row, new_position.column - 1)
    end

    def position_is_valid?(state, position)
        # verificar que este en la grid
        is_invalid = ((position.row >= state.grid.rows ||
            position.row < 0) || (position.column >= state.grid.columns ||
            position.column < 0))
        return false if is_invalid
        # verificar que no este superponiendo a la serpiente
        return !(state.snake.positions.include? position)
    end

    def move_snake_to(state, position)
        new_ positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state
    end

    def end_game(state)
        state.game_finished = true
        state
    end
end