# Enumerable#map method iterates over objects , block performs some operation 
# The returned values from the block are built up into an array that is returned 

def map(arr)
  new_arr = []
  arr.each do |element|
    new_arr << yield(element)
  end 
  new_arr
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]