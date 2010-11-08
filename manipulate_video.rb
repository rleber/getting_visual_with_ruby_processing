require 'ruby-processing'
class ManipulateVideoImageSketch < Processing::App
  load_library "video"
  import "processing.video" 

  def setup
    @video = Capture.new(self, width, height, 30)
  end

  def draw
    @video.read if @video.available
    tint mouse_x, mouse_y, 255
    image @video, 0, 0, mouse_x, mouse_y
  end
end

ManipulateVideoImageSketch.new :title => "Manipulate Video Image", :width => 640, :height => 480
