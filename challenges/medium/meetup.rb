# - construct objects that represent a meetup date
# - each object takes a month number (1-12) and a year num
# - object shoud be able to determine the exact date of the meeting in the specified month and year
# - case of the given strings is irrelevant, teenth is any day 13->19
require 'date'

class Meetup
  attr_reader :year, :month

  def initialize(year, month)
    @year = year 
    @month = month
  end

  def day(d, num)
    get_all_days(d.capitalize)
    get_specific_day(num.downcase)
  end

  def get_all_days(day)
    @days = []
    last_day = Date.civil(year, month, -1).day

    1.upto(last_day) do |d|
      date_obj = Date.civil(year, month, d)
      @days << date_obj if date_obj.strftime("%A") == day
    end
  end

  def get_specific_day(num)
    case num
    when 'first'  then @days[0]
    when 'second' then @days[1]
    when 'third'  then @days[2]
    when 'fourth' then @days[3]
    when 'fifth'  then @days[4]
    when 'last'   then @days[-1]
    else               get_teenth
    end 
  end

  def get_teenth
    @days.each do |date|
      return date if (13..19).include?(date.day)
    end 
  end
end
