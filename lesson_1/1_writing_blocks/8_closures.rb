def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end 

p results

# -------------------------------------------

def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call
p s1.call
p s1.call
puts 

s2 = sequence
p s2.call
p s1.call
p s2.call