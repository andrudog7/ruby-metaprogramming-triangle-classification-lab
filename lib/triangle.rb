class Triangle
  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    if self.side_1 <= 0 or self.side_2 <= 0 or self.side_3 <= 0
      begin
        raise TriangleError
      end
    elsif (self.side_1 + self.side_2 <= self.side_3) or
          (self.side_2 + self.side_3 <= self.side_1) or 
          (self.side_3 + self.side_1 <= self.side_2)
          begin
            raise TriangleError
          end
    end
    if self.side_1 == self.side_2 && self.side_2 == self.side_3
      :equilateral
    elsif (self.side_1 == self.side_2 && self.side_1 != self.side_3) or
        (self.side_2 == self.side_3 && self.side_2 != self.side_1) or 
        (self.side_3 == self.side_1 && self.side_3 != self.side_2)
        :isosceles
    elsif self.side_1 != self.side_2 && self.side_1 != self.side_3 && self.side_2 != self.side_3
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "All sides of a triangle must be greater than 0 and the sum of two sides must be greater than the 3rd side."
    end
  end
end
