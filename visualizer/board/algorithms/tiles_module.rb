module Tiles
    

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