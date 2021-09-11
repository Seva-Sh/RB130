# This class represents a collection of TOdo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(task)
    if task.class != Todo
      raise TypeError.new("Can only add Todo objects")
    else
      self.todos << task
    end 
  end

  def <<(task)
    add(task)
  end

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |task| task.done? }
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    task = item_at(idx)
    task.done!
  end

  def mark_undone_at(idx)
    task = item_at(idx)
    task.undone!
  end

  def done!
    todos.each do |task|
      task.done!
    end 
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    task = item_at(idx)
    todos.delete(task)
  end

  def to_s
    puts "---- #{title} ----"
    todos.each { |task| puts task }
  end

  def each
    todos.each do |task|
      yield(task)
    end 
    self
  end

  def select(name)
    temp_obj = TodoList.new(name)
    each do |task|
      temp_obj << task if yield(task)
    end 
    temp_obj
  end

  def find_by_title(str)
    each do |todo|
      return todo if todo.title == str
    end 
    nil
  end

  def all_done
    done_list = select('Done Todos') do |todo|
                  todo.done?
                end 
    done_list
  end

  def all_not_done
    not_done_list = select('Not Done Todos') do |todo|
                      !todo.done?
                    end
    not_done_list 
  end

  def mark_done(str)
    each do |todo|
      todo.done! if todo.title == str
    end 
    nil
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end 
    nil
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end 
    nil
  end
end

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done 
  end
end

todo1 = Todo.new("Buy milk") 
todo2 = Todo.new("Clean room")
todo3 =Todo.new("Go to gym")

list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_all_done
list.mark_all_undone
puts list

