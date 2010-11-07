# follow_mouse.rb  
def setup
  color_mode HSB, 1.0
  no_stroke 
  ellipse_mode CENTER
end

def draw
  background 0.0, 0.0, 1.0
  fill mouse_x.to_f / width, mouse_y.to_f / height, 1.0
  ellipse mouse_x, mouse_y, 50, 50
end
