# Method begins by iterating over each element
# until it find an element for whih the block returns false or nil

# - Take an array, return all elements of the array, except thos els at the beginning of the array
#   - that produce a truthy value
# - for empty array or if the block returns all truthy values return empty array

def drop_while(arr)
  arr.each_with_index do |el, idx|
    if !!yield(el) == true
      next
    else   
      return arr[idx..-1]
    end 
  end 

  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []