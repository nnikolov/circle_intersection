class Circle

  attr_accessor :x, :y, :r

  def initialize(params)
    self.x = params[:x]
    self.y = params[:y]
    self.r = params[:r]
  end

end
