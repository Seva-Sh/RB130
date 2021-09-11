# Take an array as an argument
# Return count of the number of times the block returns true

# def count(arr)
#   count = 0
#   arr.each do |element|
#     count += 1 if yield(element)
#   end 
#   count
# end

def count(arr)
  total = 0
  idx = 0
  idx.upto(arr.size - 1) do |idx|
    total += 1 if yield(arr[idx])
  end 

  total 
end

def count(arr)
  arr.select {|value| yield(value)}.size
end

def count(arr)
  arr.reduce(0) {|count, el| yield(el) ? count + 1 : count}
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2