def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

base8_proc = method(:convert_to_base_8).to_proc

x = [8, 10, 12, 14, 16, 33].map(&base8_proc)

p x

# # The correct type of argument must be used below
# base8_proc = method(argument).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# [8, 10, 12, 14, 16, 33].map(&a_proc)

# This is how it looks

def convert_to_base_8(n)
  n.to_s(8).to_i
end
# ->
Proc.new { |n| n.to_s(8).to_i }
# when we use & to convert our prock to a block, it expands out to...

# -> 
[8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }