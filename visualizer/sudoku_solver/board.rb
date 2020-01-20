require "set"

class Board
    def self.generate_board
        matrix = ["53..7....",
                "6..195...",
                ".98....6.",
                "8...6...3",
                "4..8.3..1",
                "7...2...6",
                ".6....28.",
                "...419..5",
                "....8..79"]
        matrix
    end
    
    attr_reader :rows, :existing_num_set
    attr_accessor :num_set
    
    def initialize 
        @rows = Board.generate_board
        @num_set = Board.make_set(@rows)
    end

    def self.make_set(board)
        setset = Set.new
        board.each_with_index do |row, idx1|
            row.each_char.with_index do |char, idx2|
                setset.add([idx1, idx2]) if board[idx1][idx2] != "." 
            end
        end
        setset
    end
    
end
