require "colorize"
require_relative "board"
require "set"

class Render_board
    def self.render_board(board_instance, board)
        puts "                -- Sudoku Solver --                 "
        puts "-----Our Solver----            ----Original Sudoku----"
        board.each_with_index do |row, idx1|
            colored = row.chars.map.with_index do |el, idx2|
                if board_instance.num_set.include?([idx1, idx2])
                    el.colorize(:color => :white)
                else
                    el.colorize(:color => :red)
                end
            end
            original = row.chars.map.with_index do |el, idx2|
                if board_instance.num_set.include?([idx1, idx2])
                    el.colorize(:color => :white)
                else
                    el = "."
                    el.colorize(:color => :white)
                end
            end
            puts "|#{colored.join("|")}|              |#{original.join("|")}|"
        end
    end
end