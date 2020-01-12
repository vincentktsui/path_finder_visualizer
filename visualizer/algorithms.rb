require 'colorize'
require "byebug"
class BFS
    attr_reader :end_point, :board, :travel_path, :parent_node

    def initialize(board, end_point)
        @parent_node = board.tree
        @board = board
        @end_point = end_point
        board[end_point].change_color(:R)
        @travel_path = []
    end

    def breadth_first_search(end_point)
        queue = [@parent_node]
        new_node = @parent_node
        # debugger
        until queue.empty? || new_node.pos == end_point
            new_node = queue.shift
            children = new_node.children
            change_tiles(children, :B)
            render_cur
            children.each do |child|
                return child if child.pos == end_point
                queue << child
            end
        end
        new_node
    end

    def create_path(target_node = self.breadth_first_search(end_point))
        current_node = target_node
        @travel_path << current_node.pos
        until current_node == @parent_node
            current_node.change_color(:R)
            render_cur
            @travel_path << current_node.parent.pos
            current_node = current_node.parent
        end
        @travel_path
    end

    def change_tiles(children, color)
        children.each do |child|
        child.change_color(color) if child.color != :R
        end
    end

    def render_cur
        system("clear")
        board.render
        sleep(0.005)
    end
end