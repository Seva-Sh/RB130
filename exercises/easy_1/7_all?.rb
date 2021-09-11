# Pass each element value to a block 
# If block returns a value ot true for every element then return true
# Otherwise false, stop searching as soon as you get false

def all?(arr)
  arr.each do |element|
    return false unless yield(element) 
  end 
  
  true
end


p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true