require 'time'

def time_this
  start =Time.now 
  yield 
  finish = Time.now 
  puts "#{finish - start} seconds"
end

def divisors(int)
  result = [1, int]

  num1 = 2
  num2 = int
  loop do 
    break if num1 > num2
    if int % num1 == 0
      result << num1 
      num2 = int / num1 
      result << num2
    end 
    num1 += 1
  end

  result.uniq.sort
end

def divisors(int)
  return [1] if int == 1
  return [1, int] if int.prime?

  new_int = int / 2
  arr = [new_int]
  1.upto(new_int) do |num|
    arr << num if int % num == 0
  end 

  result = []
  max = int
  start = 1
  loop do
    if int % start == 0
      result << start
      max = int / start
      result << max 
    end 
    start += 1
    break if start > max
  end

  result.uniq.sort
end

def divisors(int)
  set = Set[1, int]
  max = int
  counter = 2
  loop do
    break if counter >= max
    if int % counter == 0
      set << counter
      max = int / counter
      set << max
    end
    counter += 1
  end
  set.to_a.sort
end

def divisors(n)
  arr = []
  1.upto(Math.sqrt(n)) { |i| (arr << i << n / i) if (n % i == 0) }
  # go from 1 upto square root, and include same time both divisible numbers
  arr.uniq.sort
end

p divisors(1) #== [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891)  #== [1, 9967, 9973, 99400891] # may take a minute