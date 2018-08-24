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
end
