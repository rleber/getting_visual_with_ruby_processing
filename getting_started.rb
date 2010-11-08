def setup
  size 200, 200
  background 0
  no_stroke
  smooth
  @rotation = 0
end

def draw
  fill 0, 20
  rect 0, 0, width, height
  
  translate width/2, height/2
  rotate @rotation

  fill 255
  ellipse 0, -60, 20, 20

  @rotation += 0.1
end