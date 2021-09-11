# - clock independent of date 
# - can add and subtract minutes from the time represented by a given clock object
# - two clock objects that represent the same time should be equal to each other

class Clock
  attr_reader :mins

  def initialize(mins)
    @mins = mins
  end
  
  def self.at(hours, mins = 0)
    m = hours * 60 + mins
    Clock.new(m)
  end

  def +(mins)
    @mins += mins
    adjust_mins
    Clock.new(@mins)
  end

  def -(mins)
    @mins -= mins
    adjust_mins
    Clock.new(@mins)
  end

  def to_s
    calculate_hours
    format('%02d:%02d', @hrs, @mins)
  end

  def adjust_mins # keep minutes within range 0 -> 1440
    loop do
      break if @mins >= 0 && @mins <= 1440
      @mins -= 1440 if @mins > 1440
      @mins += 1440 if @mins < 0
    end
  end

  def calculate_hours
    adjust_mins
    @hrs, @mins = @mins.divmod(60)
  end

  def ==(other)
    @mins == other.mins
  end
end
