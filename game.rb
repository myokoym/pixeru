class Game
  KANA_CODEPOINT_BASE = "ぁ".ord

  attr_reader :color, :cursor_x, :cursor_y
  def initialize
    Window.bgcolor = [128, 128, 128]
    @font = Image[:font].slice_tiles(94, 5).slice(94 * 3, 94)
    @color = [255, 255, 255]
    @cursor_x = 0
    @cursor_y = 0
    @canvas = Canvas.new(self)
  end

  def update
    if Input.key_push?(K_LEFT)
      @cursor_x -= 1
      if @cursor_x < 0
        @cursor_x = 0
      end
    elsif Input.key_push?(K_RIGHT)
      @cursor_x += 1
      if @cursor_x >= GRID_WIDTH
        @cursor_x = GRID_WIDTH - 1
      end
    elsif Input.key_push?(K_UP)
      @cursor_y -= 1
      if @cursor_y < 0
        @cursor_y = 0
      end
    elsif Input.key_push?(K_DOWN)
      @cursor_y += 1
      if @cursor_y >= GRID_WIDTH
        @cursor_y = GRID_WIDTH - 1
      end
    end
  end

  def draw_text(x, y, text)
    text.each_char.with_index do |char, i|
      if char == " "
        index = -1
      else
        index = char.ord - KANA_CODEPOINT_BASE
      end
      Window.draw(x + i * 8 * 2, y, @font[index])
    end
  end

  def run
    Window.loop do
      update
      @canvas.update
      @canvas.draw
    end
  end
end
