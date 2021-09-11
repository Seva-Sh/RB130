

def count(arr=[])
  count = 0
  arr.each do |element|
    count += 1 if yield(element)
  end 
  count
end

def count(*arguments)
  total = 0
  arguments.each {|el| total += 1 if yield(el)}
  total
end

p count([1, 3, 6]) { |value| value.odd? } == 2
p count([1, 3, 6]) { |value| value.even? } == 1
p count([1, 3, 6]) { |value| value > 6 } == 0
p count([1, 3, 6]) { |value| true } == 3
p count() { |value| true } == 0
p count([1, 3, 6]) { |value| value - 6 } == 3