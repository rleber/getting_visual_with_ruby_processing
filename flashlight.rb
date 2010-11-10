def setup
  size 267, 200
  @image = load_image 'trex.jpg'
  @image_pixels = @image.pixels.
    map {|p| [red(p), green(p), blue(p)]}
end

def draw
  load_pixels 
  width.times do |x|
    height.times do |y|
      loc = x + y * width 
      distance = dist(x, y, mouseX, mouseY)
      adjustment = (75 - distance) / 75
      pixels[loc] = color(*@image_pixels[loc].
        map {|rgb| rgb * adjustment })
    end
  end
  update_pixels
end
