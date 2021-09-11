# abundant / perfect / deficient. The sum of all positive divisors is called Aliquot sum
# Perfect numbers have an Aliquot sum that is equal to the original number
# Abundant numbers have an Aliquot sum that is greater than the original number
# Deficient numbers have an Aliquot sum that is less than the original number

# Build an array of all possible divisors, sum it up, decide what number it is

class PerfectNumber
  def self.classify(num)
    raise StandardError if num <= 0

    sum = 0
    1.upto(num - 1) do |n|
      sum += n if num % n == 0
    end 

    if sum == num
      return 'perfect'
    elsif sum > num
      return 'abundant'      
    else
      return 'deficient'
    end
  end
end
