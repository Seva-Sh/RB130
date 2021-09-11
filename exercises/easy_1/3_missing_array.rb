# - Iterate over numbers
#   - start num first element in the array
#   - end num last element in the array
# - iterate over each number adding 1 every iteration
# - check if current number is included in the given array?
#   - if it it, go to the next, 
#   - if it is not, add current number to a new array

def missing(arr)
  new_arr = []
  return new_arr if arr.size == 1

  arr[0].upto(arr[-1]) do |num|
    new_arr << num if !arr.include?(num)
  end 

  new_arr
end

#LS
def missing(arr)
  arr2 = []
  arr.each_cons(2) do |num1, num2|
    arr2.concat(((num1 + 1)..(num2 - 1)).to_a)
  end 
  arr2
end

def missing(arr)
  (arr[0]..arr[-1]).to_a #- arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []