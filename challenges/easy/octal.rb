# octal to decimal conversion, given an octal input string, program should produce
# a decimal output. Invalid input is octal 0
# Iterate over each digit of the given number
#   upon each iteration increase number that you miltiply it with by 8 and sum total

class Octal
  
  def initialize(num)
    @num = num 
  end

  def to_decimal
    return 0 if @num.match(/[^\d]|[89]/)

    num = @num.to_i.digits
    total, pwr = 0, 0

    num.each do |n|
      total += n.to_i * 8**pwr 
      pwr += 1
    end 

    total
  end
end

