class Cell
  attr_reader :image
  def initialize(image)
    @image = image
  end

  def set_color(color)
    @image = Image.new(CELL_WIDTH, CELL_WIDTH, color)
  end
end

class Canvas
  def initialize(game)
    @game = game
    @grid = Array.new(16) do
      Array.new(16) do |i|
        Cell.new(Image.new(CELL_WIDTH, CELL_WIDTH, [0, 0, 0]))
      end
    end
  end

  def update
    if Input.key_down?(K_SPACE)
      cell = @grid[@game.cursor_y][@game.cursor_x]
      cell.set_color(@game.color)
    end
  end

  def draw
    @grid.each.with_index(1) do |row, y|
      row.each.with_index(1) do |cell, x|
        Window.draw(x * CELL_WIDTH, y * CELL_WIDTH, cell.image)
      end
    end
  end
end
