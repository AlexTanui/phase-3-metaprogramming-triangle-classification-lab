class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if !valid_triangle?
      raise TriangleError.new("Invalid triangle")
    elsif side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def valid_triangle?
    return false if side1 <= 0 || side2 <= 0 || side3 <= 0
    return false if side1 + side2 <= side3 || side2 + side3 <= side1 || side1 + side3 <= side2
    true
  end

  class TriangleError < StandardError
  end
end

