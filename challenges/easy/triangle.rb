# an equilateral triangle has all three seides the same length
# an isosceles triangle has exactly two sides of the same length
# a scalene triangle has all sides of different lengths
# for a shape to be a triangle all sides must be of length > 0
# also the sum of the lengths of any two sid


class Triangle
  def initialize(side1, side2, side3)
    raise ArgumentError if !confirm_nums?(side1, side2, side3)
    @side1 = side1 
    @side2 = side2
    @side3 = side3
  end

  def kind
    return 'equilateral' if equilateral?
    return 'isosceles' if isosceles?
    return 'scalene' if scalene?
  end

  def confirm_nums?(num1, num2, num3)
    return false if [num1, num2, num3].include?(0)
    if num1 + num2 <= num3 || num1 + num3 <= num2 || num2 + num3 <= num1 
      return false
    end
    true
  end

  def equilateral?
    [@side1, @side2, @side3].count(@side1) == 3
  end

  def isosceles?
    if @side1 == @side2 
      @side2 != @side3 && @side1 != @side3
    elsif @side2 == @side3
      @side1 != @side3 && @side1 != @side2
    elsif @side1 == @side3
      @side2 != @side3 && @side1 != @side2
    end 
  end

  def scalene?
    @side1 != @side2 && @side2 != @side3 && @side1 != @side3
  end
end

class Triangle # v2, better
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    raise ArgumentError unless is_triangle?
  end

  def is_triangle?
    return false if @sides.any? {|num| num <= 0}
    @sides[0] + @sides[1] > @sides[2]
  end 

  def kind
    if equilateral?
      return 'equilateral'
    elsif isosceles? 
      return 'isosceles'
    else  
      return 'scalene'
    end 
  end

  def equilateral?
    @sides.uniq.size == 1
  end

  def isosceles?
    @sides.uniq.size == 2
  end
end