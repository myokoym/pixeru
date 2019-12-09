require "dxopal"
include DXOpal

require_remote "game.rb"
require_remote "canvas.rb"

CELL_WIDTH = 20
GRID_WIDTH = 16

Image.register(:font, "font/misaki_gothic_x2.png")

Window.load_resources do
  game = Game.new
  game.run
end
