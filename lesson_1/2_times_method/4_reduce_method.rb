# x = [1,2,3].reduce do |acc, num|
#   acc + num
# end 

def reduce(arr, acc = 0)
  counter = 0

  while counter < arr.size
    acc = yield(acc, arr[counter])

    counter += 1
  end 

  acc
end

arr = [1, 2, 3, 4, 5]

x = reduce(arr) { |acc, num| acc + num}
p x