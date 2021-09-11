# - Rotation by 13 letters, wrapping back to the beginnig whever required
# - Build an array of letter, where index of each of each will refer to its count as well

# ALPH = ('a'..'z').to_a
# ALPH_CAP = ('A'..'Z').to_a

# def rot13(str)
#   new_str = ''
#   str.each_char do |char|
#     if ALPH.include?(char) 
#       new_str += get_letter('low', char)
#     elsif ALPH_CAP.include?(char)
#       new_str += get_letter('cap', char)
#     else
#       new_str += char
#     end 
#   end 
#   new_str
# end

# def get_letter(group, char)
#   return_idx = ALPH.index(char.downcase) + 13
#   return_idx -= 26 if return_idx > 25

#   group == 'low' ? ALPH[return_idx] : ALPH_CAP[return_idx]
# end

def rot(str)
  new_str = ''

  str.each_char do |char|
    if (65..90).include?(char.ord)
      new_str += get_upper(char)
    elsif (97..122).include?(char.ord)
      new_str += get_lower(char)
    else 
      new_str += char
    end
  end 

  new_str
end

def get_upper(char)
  if char.ord < 78
    (char.ord + 13).chr 
  else  
    (char.ord - 13).chr
  end 
end

def get_lower(char)
  if char.ord < 110
    (char.ord + 13).chr 
  else  
    (char.ord - 13).chr
  end 
end

# LS

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end 
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr   
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr 
  else                          encrypted_char
  end
end

names = ["Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"]

names.each do |name|
  p rot13(name)
end 


