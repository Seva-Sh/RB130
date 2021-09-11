items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) do |item|
  puts item.join(", ")
end

gather(items) do |item|
  puts "We have gathered some vegetables: #{item[1]}, #{item[2]}."
end