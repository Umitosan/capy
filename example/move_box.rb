require 'rubygems'
require 'gosu'
include Gosu

# ======================================================================#
# ======================================================================#
# ======================================================================#

class MyWindow < Window
  def initialize
    super 500, 500, false
    @frame = 0
    @colorRed = 0x80ff0000
    @colorGreen = 0x8000ff00
    @colorBlue = 0x800000ff
    @colorYellow = 0x80ffff00
    @colorOrange = 0x80ff9900
    @colorMint = 0x8000ffbb
    @colorBrightPurple = 0x80ff00ff
    @player1 = Player.new
  end

  def draw_rect(x, y, w, h, color)
    draw_quad x, y, color, x + w, y, color,
              x, y + h, color, x + w, y + h, color
  end

  def frame_count
    if (@frame == 60)
      @frame = 1
    end
    @frame += 1
  end

  def update
    frame_count
    if Gosu::button_down?(Gosu::KbLeft) then
      @player1.reset_vel
      @player1.x_vel = -5
      @player1.move
    end
    if Gosu::button_down?(Gosu::KbRight) then
      @player1.reset_vel
      @player1.x_vel = 5
      @player1.move
    end
    if Gosu::button_down?(Gosu::KbUp) then
      @player1.reset_vel
      @player1.y_vel = -5
      @player1.move
    end
    if Gosu::button_down?(Gosu::KbDown) then
      @player1.reset_vel
      @player1.y_vel = 5
      @player1.move
    end
  end

  def draw
    draw_rect(0, 0, 600, 600, @colorMint)    # background
    @player1.draw
  end
end # END MyWindow

# ======================================================================#
# ======================================================================#
# ======================================================================#

class Player
  attr_accessor(:x, :y, :x_vel, :y_vel)

  def initialize
    @x = @y = 30
    @x_vel = @y_vel = 0
  end

  def move
    @x += @x_vel
    @y += @y_vel
  end

  def reset_vel
    @x_vel = 0
    @y_vel = 0
  end

  def draw
    draw_rect(@x, @y, 20, 20, 0x90ff0000)
  end
end # END Player


MyWindow.new.sho
