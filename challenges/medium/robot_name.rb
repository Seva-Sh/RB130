# program manages robot factory settings
# name is like LET LET NUM NUM NUM
# should be able to reset the name of the robot
# should avoid using same name twice 

class Robot
  @@taken_names = []

  def initialize
    @name = nil
  end

  def name
    if @name == nil
      n = nil
      loop do
        n = generate_name
        break if !@@taken_names.include?(n)
      end
      @@taken_names.push(n)
      @name = n
    end  

    @name
  end

  def generate_name
    str = ''
    0.upto(4) do |idx|
      if idx == 0 || idx == 1
        str += get_letter
      else  
        str += get_num.to_s
      end 
    end

    str
  end

  def get_letter
    arr = ('A'..'Z').to_a
    arr.sample
  end

  def get_num
    arr = (0..9).to_a
    arr.sample
  end

  def reset 
    @name = nil
    name
  end
end

