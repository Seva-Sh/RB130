# Pass each element value to a block that is provided in the method call
# If block returns true for any element then return true, stop searching and return, otherwise false


def any?(arr)
  arr.each do |element|
    return true if yield(element)
  end

  false 
end



p any?({1 => 2, 3 => 4}) { |value| p value } #== true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false