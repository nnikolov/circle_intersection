require 'circle_intersection/circle'

class Circles

  attr_accessor :circle1, :circle2
 
  def initialize(circle1, circle2)
    self.circle1 = circle1
    self.circle2 = circle2
  end
 
  def distance_between_circle_centers
    Math.sqrt((circle2.x - circle1.x) ** 2 + (circle2.y - circle1.y) ** 2)
  end
end
