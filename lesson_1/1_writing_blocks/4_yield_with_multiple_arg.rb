def test
  yield(1, 2)
end

test {|num| puts num}

# works fine, and puts 1

def test
  yield(1)
end

test do |num1, num2|
  p "#{num1} #{num2}"
end 