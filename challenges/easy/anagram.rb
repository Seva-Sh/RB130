# Program takes a word and a list of possible anagrams and selects the correct sublist 
# that contains the anagrams of the word
# for example, word listen 

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(arr)
    chars = @word.chars.sort 
    words = []
    arr.each do |word|
      downcased = word.downcase
      next if @word.eql?(downcased)
      words << word if downcased.chars.sort == chars
    end 
    
    words
  end
end

