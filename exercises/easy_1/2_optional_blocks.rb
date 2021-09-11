def compute
  block_given? ? yield : 'Does not compute'
end

def compute_with_arg(obj)
  block_given? ? yield(obj) : 'Does not compute'
end

p compute {5 + 3} == 8
p compute {'a' + 'b'} == 'ab'
p compute == 'Does not compute'

p compute_with_arg(5) {|int| int + 3} == 8
p compute_with_arg('a') {|str| str + 'b'} == 'ab'
p compute_with_arg(:v) == 'Does not compute'