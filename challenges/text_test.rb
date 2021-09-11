require 'minitest/autorun'

require_relative 'text'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    todo = @list.pop 
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @todo1.done! 
    @todo2.done! 
    @todo3.done!
    
    assert(@list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(5) }
    assert_raises(TypeError) { @list.add('Hi') }
  end

  def test_shovel
    @todo4 = Todo.new('Something')
    @list.<<(@todo4)
    assert_includes(@list.to_a, @todo4)
  end
  
  def test_shovel_alias_add
    @todo4 = Todo.new('Something')
    @list.add(@todo4)
    @todos << @todo4 
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(10) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }

    @list.mark_done_at(0)

    assert(@todo1.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }

    @list.mark_done_at(0)
    @list.mark_undone_at(0)

    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_done
    @list.done! 

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }

    todo = @list.remove_at(1)

    assert_equal(@todo2, todo)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s2
    @todo2.done! 

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s3
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    new_todos = []
    @list.each { |el| new_todos << el }
    assert_equal(@todos, new_todos)
  end

  def test_each_2
    assert_equal(@list, @list.each { nil })
  end

  def test_select
    list = @list.select { |el| !el.done? }

    assert_equal(list.to_a, @list.to_a)
    assert_equal(list.title, @list.title)
    refute_equal(list.object_id, @list.object_id)
  end
end