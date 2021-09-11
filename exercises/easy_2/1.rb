

def step(start_value, end_value, step_value)
  current_value = start_value
  while current_value <= end_value
    yield(current_value)
    current_value += step_value
  end 
end

p step(1, 10, 3) {|value| puts "value = #{value}"} 