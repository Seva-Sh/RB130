def print_names(n1, n2)
  yield(n1) # mistakenly we only pass one name, but no errors raised
end

print_names("John", "Bob") do |name1, name2|
  puts "#{name1} and #{name2}"
end