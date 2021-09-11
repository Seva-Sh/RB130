items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*items, item|
  puts items.join(', ') 
  puts item
end

gather(items) do |item1, *items, item2|
  puts item1 
  puts items.join(', ')
  puts item2 
end 

gather(items) do |item1, *items|
  puts item1 
  puts items.join(', ')
end 

gather(items) do |i1, i2, i3, i4|
  puts [i1, i2, i3, i4].join(", ")
end 