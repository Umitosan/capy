require 'rubygems'
require 'gosu'
include Gosu

class MyWindow < Window
  def initialize
    super 500, 500, false
    @frame_num = 0
    @back_light = -1
  end

  def draw_rect(x, y, w, h, color = 0x40ff0000)
    draw_quad x, y, color, x + w, y, color,
              x, y + h, color, x + w, y + h, color
  end


  def frame_count
    if (@frame_num == 60)
      @frame_num = 1
      @back_light *= -1
    end
    @frame_num +=1
  end

  def update

    frame_count
  end

  def draw
    draw_rect(5, @frame_num*4, 20, 20)
    if (@back_light == -1)
      draw_rect(0, 0, 400, 300)
    end
  end
end

MyWindow.new.show
