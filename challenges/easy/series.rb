# Program will take a string of digits, returns all the possible consecutive number series
# of a specified length in that string
# if series is more that string length , then throw an error

class Series
  def initialize(str)
    @str = str
  end

  def slices(length)
    raise ArgumentError if length > @str.size

    arr = []
    0.upto(@str.size - length) do |idx|
      nums_arr = get_nums(@str[idx, length]) 
      arr << nums_arr
    end 

    arr
  end

  def get_nums(str)
    nums = []
    str.chars.each do |num|
      nums << num.to_i
    end 

    nums 
  end
end

x = Series.new('01234')
p x.slices(2)