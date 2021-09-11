class BeerSong

  def self.lyrics
    self.verses(99, 0)
  end

  def self.verse(num)
    self.get_verse(num)
  end

  def self.verses(*num)
    str = ""

    num[0].downto(num[1]) do |n|
      if n == num[1]
        str << self.get_verse(n)
      else  
        str << self.get_verse(n)
        str << "\n"
      end
    end 

    str
  end

  def self.get_verse(num)
    choice1 = ["No more bottles", "#{num} bottle", "#{num} bottles"]
    choice2 = ["Go to the store and buy some more", "Take it down and pass it around", "Take one down and pass it around"]
    choice3 = ["99 bottles", "no more bottles", "#{num - 1} bottle", "#{num - 1} bottles"]
    if num == 0
      sent1 = choice1[0]
      sent2 = choice2[0]
      sent3 = choice3[0]
      sent4 = "no more bottles"
    else  
      sent1 = num == 1 ? choice1[1] : choice1[2]
      sent4 = sent1
      if num == 1
        sent2 = choice2[1]
        sent3 = choice3[1]
      elsif num == 2  
        sent2 = choice2[2]
        sent3 = choice3[2]
      else   
        sent2 = choice2[2]
        sent3 = choice3[3]
      end 
    end 

    "#{sent1} of beer on the wall, #{sent4} of beer.\n" \
    "#{sent2}, #{sent3} of beer on the wall.\n" \
  end
end
