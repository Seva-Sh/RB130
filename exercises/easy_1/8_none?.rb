# If block returns true for any element then retunr false
# Otherwise return true, stop searching if you get true 

def any?(arr)
  arr.each do |element|
    return true if yield(element)
  end

  false 
end

def none?(arr, &block)
  # arr.each do |element|
  #   return false if yield(element)
  # end 
  !any?(arr, &block)
  # true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true