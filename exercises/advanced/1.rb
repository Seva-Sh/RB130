# fact = Enumerator.new do |x|
#   total = 1
#   1.upto(x) do |num|
#     total *= num 
#   end 
#   total 
# end

# fact.take(5)

fact = Enumerator.new do |y|
  a = 1
  y << a
  loop do
    y << (1..a).inject(&:*)
    a += 1
  end
end 

fact.each_with_index do |num, idx|
  p num
  break if idx >= 5
end 

# factorial = Enumerator.new do |yielder|
#   total = 1
#   number = 0
#   loop do
#     total = number.zero? ? 1 : total * number 
#     yielder << total
#     number += 1
#   end
# end 

# # External Iterators

# 6.times { |num| puts "#{num}! == #{factorial.next}" }
# puts ''
# 6.times { |num| puts "#{num}! == #{factorial.next}" }
# puts ''
# factorial.rewind
# 6.times { |num| puts "#{num}! == #{factorial.next}" }
# puts ''

# # Internal Iterators

# factorial.each_with_index do |value, number|
#   puts "#{number}! == #{value}"
#   break if number >= 5
# end 