class Cipher
  LOWER_ALPH = [*'a'..'z']
  CAP_ALPH = [*'A'..'Z']

  def self.rotate(word, step)
    new_word = ''
    word.chars.each do |letter|
      new_word += if !letter.match(/[a-zA-Z]/)
                    letter
                  else
                    determine_letter(letter, step)
                  end
    end

    new_word
  end

  def self.determine_letter(letter, step)
    current_idx = determine_start_index(letter)
    end_index = determine_end_index(current_idx, step)

    if LOWER_ALPH.include?(letter)
      LOWER_ALPH[end_index]
    else
      CAP_ALPH[end_index]
    end
  end

  def self.determine_start_index(letter)
    if LOWER_ALPH.include?(letter)
      LOWER_ALPH.index(letter)
    else
      CAP_ALPH.index(letter)
    end
  end

  def self.determine_end_index(idx, step)
    step.times do |_|
      idx += 1
      if idx >= 26
        idx = 0
      end
    end

    idx
  end
end
