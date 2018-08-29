require 'circle_intersection/circle'
require 'circle_intersection/point'

class Circles

  attr_accessor :circle1, :circle2
 
  def initialize(circle1, circle2)
    self.circle1 = circle1
    self.circle2 = circle2
  end
 
  def distance_between_circle_centers
    Math.sqrt((circle2.x - circle1.x) ** 2 + (circle2.y - circle1.y) ** 2)
  end

  def intersection?
    return false if separate_circles?
    return false if contained_within?
    return false if coincident?
    true
  end

  # If the distance between the two circles is grater than the two radii, the circles are separate.
  def separate_circles?
    distance_between_circle_centers > circle1.r + circle2.r
  end

  # If the distance between the two circles is smaller than absolute value of radius 1 minus radius 2, 
  # then one circle is contained within the other
  def contained_within?
    distance_between_circle_centers < (circle1.r - circle2.r).abs
  end

  # If the distance between the two circles is zero and radius 1 equals radius 2, then the two circles
  # are coincident
  def coincident?
    distance_between_circle_centers == 0 and circle1.r == circle2.r
  end

end
