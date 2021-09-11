# take as an input a letter, and output it in a diamond shape
# while building first half of the diamond, biuld an inverted mirror at the same time 
# minus the last, and push that mirror in afterwards

class Diamond
  ALPH = ('A'..'Z').to_a
  def self.make_diamond(l)
    return "A\n" if l == 'A'

    first_half = ''
    second_half = ''
    slice = ALPH[0..ALPH.index(l)]
    space = 1
    shift = slice.size - 1

    0.upto(slice.size - 1) do |idx|
      if idx == 0
        sent = "#{' ' * shift}#{slice[idx]}#{' ' * shift}\n"
        first_half += sent
        second_half = sent + second_half
      elsif  idx == slice.size - 1
        sent = "#{slice[idx]}#{' ' * space}#{slice[idx]}\n"
        first_half += sent
      else  
        shift -= 1
        sent = "#{' ' * shift}#{slice[idx]}#{' ' * space}#{slice[idx]}#{' ' * shift}\n"
        first_half += sent
        second_half = sent + second_half
        space += 2
      end 
    end 
    first_half + second_half
  end
end

