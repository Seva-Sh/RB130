# Method takes 2 arrays and combines then into a single array in which each element
# is a two-element array where first element is a value from one array
# and second element is a value from the second array

def zip(arr1, arr2)
  arr = []
  0.upto(arr1.size - 1) do |idx|
    arr << [arr1[idx], arr2[idx]]
  end 

  arr
end

def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, arr2[index]]
  end 
end

a1 = [1, 2, 3]
a2 = [4, 5, 6]
a3 = zip(a1, a2) 

p a1
p a2
p a3