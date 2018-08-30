require 'test_helper'

class CircleIntersectionTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, CircleIntersection
  end

  test "Subtract point from a point" do
    p1 = Point.new(x: 5, y: 7)
    p2 = Point.new(x: 1, y: 1)
    p3 = p1 - p2
    assert_equal 4, p3.x
    assert_equal 6, p3.y
  end

  test "Add point to a point" do
    p1 = Point.new(x: 5, y: 7)
    p2 = Point.new(x: 1, y: 1)
    p3 = p1 + p2
    assert_equal 6, p3.x
    assert_equal 8, p3.y
  end

  test "Distance between two points" do
    p1 = Point.new(x: 1, y: 1)
    p2 = Point.new(x: 2, y: 2)
    assert_equal 1.4142135623730951, p1.distance(p2)

    p1 = Point.new(x: 0, y: 0)
    p2 = Point.new(x: 6, y: 8)
    assert_equal 10, p1.distance(p2)
  end

  test "Separate circles" do
    c1 = Circle.new(x: 1, y: 1, r: 1)
    c2 = Circle.new(x: 5, y: 5, r: 1)
    assert c1.separate?(c2)
  end

  test "Circle within circle" do
    c1 = Circle.new(x: 5, y: 5, r: 15)
    c2 = Circle.new(x: 5, y: 5, r: 10)
    assert c1.contained?(c2)

    c1 = Circle.new(x: 5, y: 5, r: 10)
    c2 = Circle.new(x: 5, y: 5, r: 15)
    assert c1.contained?(c2)
  end

  test "Coincident circles" do
    c1 = Circle.new(x: 15, y: 15, r: 5)
    c2 = Circle.new(x: 15, y: 15, r: 5)
    assert c1.coincident?(c2)
  end

  test "Testing if two circles intersect" do
    c1 = Circle.new(x: 1, y: 1, r: 1)
    c2 = Circle.new(x: 5, y: 5, r: 1)
    assert_equal false, c1.intersects?(c2)

    c1 = Circle.new(x: 5, y: 5, r: 15)
    c2 = Circle.new(x: 5, y: 5, r: 10)
    assert_equal false, c1.intersects?(c2)

    c1 = Circle.new(x: 5, y: 5, r: 10)
    c2 = Circle.new(x: 5, y: 5, r: 15)
    assert_equal false, c1.intersects?(c2)

    c1 = Circle.new(x: 15, y: 15, r: 5)
    c2 = Circle.new(x: 15, y: 15, r: 5)
    assert_equal false, c1.intersects?(c2)

    c1 = Circle.new(x: 15, y: 15, r: 5)
    c2 = Circle.new(x: 17, y: 17, r: 5)
    assert c1.intersects?(c2)
  end

  test "Distance to chord" do
    c1 = Circle.new(x: 10, y: 10, r: 10)
    c2 = Circle.new(x: 10, y: 14, r: 10)
    assert_equal 2, c1.distance_to_chord(c2)

    c1 = Circle.new(x: 10, y: 10, r: 10)
    c2 = Circle.new(x: 10, y: 16, r: 10)
    assert_equal 3, c1.distance_to_chord(c2)
  end

  test "Height" do
    c1 = Circle.new(x: 10, y: 10, r: 10)
    c2 = Circle.new(x: 10, y: 14, r: 10)
    assert_equal 9.797958971132712, c1.height(c2)

    c1 = Circle.new(x: 10, y: 10, r: 10)
    c2 = Circle.new(x: 10, y: 16, r: 10)
    assert_equal 9.539392014169456, c1.height(c2)
  end

end
