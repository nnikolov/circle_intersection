class Circle

  attr_accessor :x, :y, :r

  def initialize(params)
    self.x = params[:x]
    self.y = params[:y]
    self.r = params[:r]
  end

  # Returns the center point of the circle
  def center
    Point.new(x: @x, y: @y)
  end

  # Returns the distance between the center of the circle
  # and the line that goes through the two points of intersection
  def distance_to_chord(other)
    d = center.distance(other.center)
    (r ** 2 - other.r ** 2 + d ** 2) / (2 * d)
  end

  # Returns half of the length of the chord line
  def height(other)
    a = distance_to_chord(other)
    Math.sqrt(r ** 2 - a ** 2)
  end

  # Returns true if the two circles intersect
  def intersects?(other)
    return false if separate?(other)
    return false if contained?(other)
    return false if coincident?(other)
    true
  end

  # If the distance between the two circles is grater than the two radii, the circles are separate.
  def separate?(other)
    center.distance(other.center) > @r + other.r
  end

  # If the distance between the two circles is smaller than absolute value of radius 1 minus radius 2, 
  # then one circle is contained within the other
  def contained?(other)
    center.distance(other.center) < (@r - other.r).abs
  end

  # If the distance between the two circles is zero and radius 1 equals radius 2, then the two circles
  # are coincident
  def coincident?(other)
    center.distance(other.center) == 0 and @r == other.r
  end

end
