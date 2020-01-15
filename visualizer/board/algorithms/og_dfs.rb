require_relative "tiles_module"
require 'colorize'
require "byebug"

class DFS
    include Tiles

    attr_accessor :travel_path, :end_point, :board, :root

    COLORS = [:G, :Y, :B, :C, :M]

    def initialize(board, end_point)
        @parent_node = board.tree
        @board = board
        @end_point = end_point
        board[end_point].change_color(:R)
        @travel_path = []
        @visited_node = Set.new
    end


    def dfs(node, target = :R) 
      current_node = node 
      return node if node.pos == end_point  
      @visited_node << node 
      render_cur
      color = COLORS.first
      COLORS.rotate!
      change_tiles(node.children, color)
      node.children.each do | child | 
          next if @visited_node.include?(child)
          result = dfs(child, target)
          return result unless result.nil? 
      end 

      nil 
    end 

    def create_path 
      target_node = dfs(@parent_node ,target = :R)
      curr_node = target_node 
      while curr_node.parent != nil 
        travel_path << curr_node
        curr_node.change_color(:R)
        # puts path 
        curr_node = curr_node.parent
        render_cur
      end 
      travel_path 
    end 
end