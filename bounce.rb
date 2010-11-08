BLUE  = "#0000FF"
GREEN = "#00FF00"
RED   = "#FF0000"

BALL_COLOR = BLUE
BALL_SPEED = 5
BALL_SIZE = 32

attr_accessor :ball_speed, :ball_color, :ball_size

def setup
  size 200,200
  @x = 1
  @ball_speed = BALL_SPEED
  @ball_color = color(hex(BALL_COLOR))
  @ball_size = BALL_SIZE
  stroke 0
  smooth
end

def draw
  background 255
  fill @ball_color
  @x += @ball_speed
  @ball_speed *= -1 unless (0..width).include? @x # bounce
  ellipse @x, 100, @ball_size, @ball_size
end
