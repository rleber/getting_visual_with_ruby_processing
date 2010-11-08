# Based on JAVA example at http://en.wikipedia.org/wiki/Processing_%28programming_language%29

@@usa = PShape.new

COLORS = {:democrat => "#0000ff", :republican => "#ff0000"}
LEGEND_POSITION = [680, 50]

@@results = {
  :democrat => {
    :candidate => 'Obama',
    :states => %w{HI RI CT MA ME NH VT NY NJ
    	 FL NC OH IN IA CO NV PA DE MD MI
    	 WA CA OR IL MN WI DC NM VA}
  },
  :republican => {
    :candidate => 'McCain',
    :states => %w{AK GA AL TN WV KY SC WY MT
    	 ID TX AZ UT ND SD NE MS MO AR OK
    	 KS LA}
  }
}

def setup
  size 950, 600
  # Blank_US_Map.svg file can be found at Wikimedia Commons
  @@usa = load_shape "http://upload.wikimedia.org/wikipedia/commons/3/32/Blank_US_Map.svg"
  smooth # Improves the drawing quality of the SVG
  text_font create_font("SanSerif", 30)
  no_loop
end
 
def draw
  background 0,0,0,0
  # Draw the full map
#  shape @@usa, 0, 0
  shape @@usa
  i = 0
  @@results.each do |party, result|
    candidate = result[:candidate]
    states = result[:states]
    c = color(hex(COLORS[party]))
    legend i, c, candidate
    color_states states, c
    i += 1
  end
  # Save the map as image
  save_frame "../output/election_2008.png"
end
 
def color_states states, c
  states.each do |s|
    state = @@usa.getChild(s)
    # Disable the colors found in the SVG file
    state.disable_style
    # Set our own coloring
    fill c
    no_stroke
    # Draw a single state
#    shape state, 0, 0
    shape state
  end
end

def legend n, color, candidate
  fill color
  text_height = text_ascent + text_descent
  text candidate, LEGEND_POSITION.first, LEGEND_POSITION.last + (n+1) * text_height
end
  
