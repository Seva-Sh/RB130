# givne a natural num and a set of one or more other numbers can find the sum of all the multiples
# of the numbers in the set that are less than the first number

class SumOfMultiples
  @@list = [3, 5]

  def initialize(*l)
    @list = l
  end

  def to(num)
    mult = []
    1.upto(num - 1) do |n|
      mult << n if @list.any? { |x| n % x == 0 }
    end 
    mult.sum
  end

  def self.to(num)
    mult = []

    @@list.each do |n|
      mult += self.get_multiples(n, num)
    end 
    mult.uniq.sum
  end

  def self.get_multiples(num, total)
    arr = []
    current_num = num
    loop do
      break if current_num >= total
      arr << current_num
      current_num += num
    end
    arr 
  end
end
