# M -> 1000; D -> 500; C -> 100; L -> 50; X -> 10; V -> 5; I -> 1
# To get the right num start from highest (leftmost)
# If greater than 999 then have M
#    if greater than 499 then have D 
#      if greater than 99 then have C 
#        if greater than 49 then have L 
#          if greater than 9 then have X 
#            if greater than 4 then have V 
#              then I

class RomanNumeral
  def initialize(num)
    @num = num
  end

  def to_roman
    roman = ''
    lvl = 1
    loop do
      @num, current_num = @num.divmod(10)
      letter = get_letter(current_num * lvl, lvl)
      roman.prepend(letter)
      lvl *= 10
      break if @num == 0
    end

    roman
  end

  def get_letter(num, lvl)
    letter = ''
    loop do
      break if num == 0
      if lvl == 1000
        letter += 'M'
        num -= 1000
      elsif lvl == 100
        letter = get_hundred(num)
        num = 0
      elsif lvl == 10 
        letter = get_tens(num)
        num = 0
      else  
        letter = get_ones(num)
        num = 0
      end 
    end

    letter
  end

  def get_hundred(num)
    letter = ''
    loop do
      break if num == 0
      if num == 900
        letter += 'CM'
        num -= 900
      elsif num >= 500
        letter += 'D'
        num -= 500
      elsif num == 400
        letter += 'CD'
        num -= 400
      else  
        letter += 'C'
        num -= 100
      end
    end
    letter
  end

  def get_tens(num)
    letter = ''
    loop do
      break if num == 0
      if num == 90
        letter += 'XC'
        num -= 90
      elsif num >= 50
        letter += 'L'
        num -= 50
      elsif num == 40
        letter += 'XL'
        num -= 40 
      else  
        letter += 'X'
        num -= 10
      end 
    end
    letter
  end

  def get_ones(num)
    letter = ''
    loop do
      break if num == 0
      if num == 9
        letter += 'IX'
        num -= 9
      elsif num >= 5 
        letter += 'V'
        num -= 5 
      elsif num == 4
        letter += 'IV'
        num -= 4
      else  
        letter += 'I'
        num -= 1
      end 
    end
    letter
  end
end
