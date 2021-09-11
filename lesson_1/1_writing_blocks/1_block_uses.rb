3.times do |num|
  puts num
end 

x = [1, 2, 3].map do |num|
  num + 1
end 
p x

x = { a: 1, b: 2, c: 3, d: 4, e: 5 }.select do |_, value|
  value > 2
end 
p x