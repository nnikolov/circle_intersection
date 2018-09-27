class Point

  attr_accessor :x, :y

  def initialize(params)
    self.x = params[:x].to_f
    self.y = params[:y].to_f
  end

  def distance(other)
    Math.sqrt((@x - other.x) ** 2 + (@y - other.y) ** 2)
  end  

  def -(other)
    Point.new(x: @x - other.x, y: @y - other.y)
  end

  def +(other)
    Point.new(x: @x + other.x, y: @y + other.y)
  end

  def scale(s)
    Point.new(x: @x * s, y: @y * s)
  end
end
