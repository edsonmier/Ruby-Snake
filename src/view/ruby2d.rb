require "ruby2d"

module View
    class Ruby2DView
        def initialize
            @pixel_size = 40
        end

        def render(state)
            extend Ruby2D::DSL
            set(
                title: "Snake", 
                width: @pixel_size * state.grid.columns,
                height: @pixel_size * state.grid.rows)
            render_snake(state)
            render_food(state)
            show 
        end

        private 

        def render_snake(state)
            extend Ruby2D::DSL
            snake = state.snake
            snake.positions.each do |pos|
                Square.new(
                    x: pos.column * @pixel_size,
                    y: pos.row * @pixel_size,
                    size: @pixel_size,
                    color: "red"
                )
            end
        end

        def render_food(state)
            extend Ruby2D::DSL
            food = state.food
            Square.new(
                x: food.column * @pixel_size,
                y: food.row * @pixel_size,
                size: @pixel_size,
                color: "yellow"
            )
        end
    end
end