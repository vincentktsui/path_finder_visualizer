require_relative "board"
require_relative "render_board"
require "colorize"
require "set"

class SudokuSolver
    attr_accessor :board, :board_instance

    def initialize
        @board_instance = Board.new
        @board = @board_instance.rows
    end

    def solver
        i = board.length-1
        j = board.length-1

        (0..i).each do |row|
            (0..j).each do |col|
                next unless @board[row][col] == "."
                options = get_options(row, col, board)
                return nil if options.empty?
                options.each do |option|
                    @board[row][col] = option
                    Render_board.render_board(board_instance, board)
                    system("clear")
                    return board if self.solver
                    @board[row][col] = "."
                end

                return nil
            end
        end
        board
    end

    def assign_block(row, col, board)
        block = []
        row_start = 3 * (row / 3)
        col_start = 3 * (col / 3)
        (0..2).each do |i|
            (0..2).each do |j|
                cur_val = board[row_start + i][col_start + j]
                block << cur_val
            end
        end
        block
    end

    def get_options(row, col, board)
        options = [*"1".."9"]

        # rows
        len = board.length
        options -= board[row].chars.uniq

        # col
        column = len.times.collect{|row| board[row][col]}
        options -= column.uniq

        # block
        options -= assign_block(row, col, board)

        options
    end
end

if __FILE__ == $PROGRAM_NAME
    s1 = SudokuSolver.new
    s1.solver
    Render_board.render_board(s1.board_instance, s1.board) 
end
