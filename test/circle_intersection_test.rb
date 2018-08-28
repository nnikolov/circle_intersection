require 'test_helper'

class CircleIntersectionTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, CircleIntersection
  end

  test "Testing distance between centers of two circles" do
    circles = Circles.new(Circle.new(x: 1, y: 1, r: 1), Circle.new(x: 2, y: 2, r: 2))
    assert_equal 1.4142135623730951, circles.distance_between_circle_centers

    circles = Circles.new(Circle.new(x: 0, y: 0, r: 1), Circle.new(x: 6, y: 8, r: 2))
    assert_equal 10, circles.distance_between_circle_centers
  end

  test "Testing separate circles" do
    circles = Circles.new(Circle.new(x: 1, y: 1, r: 1), Circle.new(x: 5, y: 5, r: 1))
    assert circles.separate_circles?
  end

  test "Testing circle within circle" do
    circles = Circles.new(Circle.new(x: 5, y: 5, r: 15), Circle.new(x: 5, y: 5, r: 10))
    assert circles.contained_within?

    circles = Circles.new(Circle.new(x: 5, y: 5, r: 10), Circle.new(x: 5, y: 5, r: 15))
    assert circles.contained_within?
  end

  test "Testing coincident circles" do
    circle = Circle.new(x: 15, y: 15, r: 5)
    circles = Circles.new(circle, circle)
    assert circles.coincident?
  end

end
