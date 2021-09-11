def select(arr)
  new_arr = []
  counter = 0

  while counter < arr.size
    new_arr << arr[counter] if yield(arr[counter])
    counter += 1
  end

  new_arr
end

x = select([1, 2, 3, 4, 5]) do |num|
  num + 1
end 

p x