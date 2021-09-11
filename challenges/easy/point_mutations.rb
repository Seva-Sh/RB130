# - if two length are of unequal length, compute for shorter length 
# - basically difference between two strings, count them 

class DNA
  def initialize(strand)
    @strand = strand.chars
  end

  def hamming_distance(strand2)
    length = determine_length(strand2)
    dist = 0
    0.upto(length - 1) do |idx|
      dist += 1 if @strand[idx] != strand2[idx]
    end 
    dist
  end

  def determine_length(str2)
    if @strand.size == str2.chars.size
      return @strand.size 
    else  
      return [@strand.size, str2.size].min
    end 
  end
end

class DNA # v2, better
  def initialize(strand)
    @strand = strand 
  end

  def hamming_distance(strand2)
    sizes = [@strand.size, strand2.size].sort
    count = 0
    0.upto(sizes[0] - 1) do |idx|
      next if @strand[idx] == strand2[idx]
      count += 1
    end 

    count
  end
end