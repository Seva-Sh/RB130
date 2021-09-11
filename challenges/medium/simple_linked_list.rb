# - each element in the list contains data and a "next" field pointing to the next element in the list
# - create a singly linked lost wohse elements may contain a range of data such as the numbers 1-10 
# - need functions to reverse the linked list and convert a linked list to and from an array

class Element
  def initialize(value, next_el = nil)
    @value = value 
    @next_el = next_el
  end

  def datum # returns the data value of the Element
    @value
  end

  def tail? # is it the last one in the list, the tail element does not have another element instance stored in the next field
    !@next_el
  end

  def next # return the next element in the linked list
    @next_el
  end
end

class SimpleLinkedList
  attr_accessor :head 

  def self.from_a(arr)
    return SimpleLinkedList.new if arr == nil || arr.empty?
    
    l = SimpleLinkedList.new
    arr = arr.reverse

    0.upto(arr.size - 1) do |idx|
      l.push(arr[idx])
    end  

    l
  end

  def to_a
    arr = []
    current_el = head

    loop do
      break if current_el == nil
      arr << current_el.datum 
      current_el = current_el.next      
    end

    arr 
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  def size
    count = 0
    current_el = head
    loop do
      break if current_el == nil
      current_el = current_el.next
      count += 1
    end
    count
  end

  def empty?
    !head
  end

  def push(val)
    prev_el = head
    self.head = Element.new(val, prev_el)
  end

  def peek
    return nil if empty?
    head.datum
  end

  def pop
    value = head.datum
    self.head = head.next

    value
  end
end

