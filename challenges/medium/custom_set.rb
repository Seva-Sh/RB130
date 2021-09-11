class CustomSet
  attr_accessor :set

  def initialize(arr = [])
    @set = arr.uniq
  end

  def contains?(num)
    return false if empty?

    set.include?(num)
  end

  def empty?
    set.empty?
  end

  def subset?(other)
    return true if other.set.nil? && set.nil?
    return true if set - other.set == []

    false
  end

  def disjoint?(other)
    return true if other.set.nil? || set.nil?
    return true if other.set - set == other.set

    false
  end

  def eql?(other)
    return true if set.nil? && other.set.nil?
    return true if set.sort.uniq == other.set.sort.uniq

    false
  end

  def add(num)
    set << num unless set.include?(num)
    self
  end

  def ==(other)
    set == other.set
  end

  def intersection(other)
    arr = []
    set.each do |el|
      arr << el if other.set.include?(el)
    end

    CustomSet.new(arr)
  end

  def difference(other)
    arr = (set - other.set)

    CustomSet.new(arr)
  end

  def union(other)
    arr = (set + other.set).uniq.sort

    CustomSet.new(arr)
  end
end
