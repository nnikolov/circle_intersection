# https://stackoverflow.com/questions/3349125/circle-circle-intersection-points

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

  # Returns the point in the center of the intersection
  def intersection_center(other)
    p0 = center
    p1 = other.center
    a = distance_to_chord other
    d = center.distance other.center
    (p1 - p0).scale(a/d) + p0
  end

  # Returns an array of the two points of intersection
  def points_of_intersection(other)
    return false unless intersects? other
    p0 = center
    p1 = other.center
    p2 = intersection_center other
    h = height other
    d = center.distance other.center

    x3 = p2.x + h*(p1.y - p0.y)/d
    y3 = p2.y - h*(p1.x - p0.x)/d
    x4 = p2.x - h*(p1.y - p0.y)/d
    y4 = p2.y + h*(p1.x - p0.x)/d

    [Point.new(x: x3, y: y3), Point.new(x: x4, y: y4)]
  end

  # Returns the larger point
  def larger_point_of_intersection(other)
    a = points_of_intersection(other)
    a.sort_by{|p| [p.x, p.y]}.last
    rescue
      false
  end

  # Returns true if the two circles intersect
  def intersects?(other)
    return false if separate? other
    return false if contained? other
    return false if coincident? other
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
