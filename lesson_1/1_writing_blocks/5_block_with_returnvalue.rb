def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  p after
  puts "After: #{after}"
end

compare('hello') {|word| word.upcase}
compare('hello') {|word| word.slice(1..2)}
compare('hello') {|word| "whatever"}
compare('hello') {|word| puts word}