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
end