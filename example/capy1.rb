require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 700, 500
    self.caption = "Gosu Tutorial Game"

    @background_image = Gosu::Image.new("img/sky_png.png", :tileable => true)

    @player = Player.new
    # @hud = Hud.new
    @player.warp(100, 100)
  end

  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @player.turn_left
      # @hud.button_txt = 'left'
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @player.turn_right
      # @hud.button_txt = 'right'
    end
    if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
      @player.accelerate
      # @hud.button_txt = 'go faster'
    end
    @player.move
  end

  def draw
    # @hud.draw
    @player.draw
    # @myFont.draw("this")
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end


# class Hud
#   attr_accessor(:button_txt)
#
#   def initialize
#     @button_font = Gosu::Font.new()
#   end
#
#   def draw
#     @button_font("this", 20, 20, 1, scale_x = 1, scale_y = 1, color = 0xff_ffffff)
#   end
# end

class Player
  def initialize
    @image = Gosu::Image.new("img/capy_right_sm.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @vel_x *= 0.96
    @vel_y *= 0.96
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end





window = GameWindow.new


window.show
