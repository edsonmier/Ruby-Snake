module Model
    class Coord < Struct.new(row, column)
        
    end

    class Food < Coord
        
    end

    class Snake < Struct.new(positions)
        
    end

    class Grid < Struct.new(rows, columns)
        
    end

    class State < Struct.new(snake, food, grid)
        
    end
end