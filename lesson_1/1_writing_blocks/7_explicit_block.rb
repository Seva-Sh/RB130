def test(&block)
  puts "What's &block? #{block}"
end

test { sleep(1) }

# ----------------------------------

def test2(block)
  puts "hello"
  block.call(">>>")   # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test{ |prefix| puts prefix + "xyz"}