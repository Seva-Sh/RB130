def splat(arr)
  yield(arr)
end 

birds = %w(raven finch hawk eagle)


splat(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(", ")}"
end


# For our solution, we start with an array named birds. 
# It contains four birds, where two of them are raptors. 
# Above we use our block variables to organize it further. 
# When we yield birds to the block, Ruby assigns the individual elements of birds 
# to the different block variables. It assigns the first two birds, "crow" and "finch," to _; 
# the underscore tells Ruby that we aren't interested in those values. 
# The splat operator on the name block variable tells Ruby to treat it as an Array and 
# assign all remaining arguments to it. 
# Here, we group the last two elements from birds into the array, raptors.

# p birds # => ['raven', 'finch', 'hawk', 'eagle']

# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']