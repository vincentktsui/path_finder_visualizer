require './algorithms/bfs.rb'
require_relative 'board'

class Game
    def initialize

    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new(35, 35)
    # p board.render
    end_point = board.rand_pos
    algo = BFS.new(board, end_point)
    algo.create_path
end