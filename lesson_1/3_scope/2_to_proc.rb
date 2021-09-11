x = [1, 2, 3, 4, 5].map do |num|
  num.to_s
end 

x = [1, 2, 3, 4, 5].map(&:to_s)


p ["hello", "world"].each(&:upcase!)
p [1, 2, 3, 4, 5].select(&:odd?)
p [1, 2, 3, 4, 5].select(&:odd?).any?(&:even?)

#---------------------------------------------

def my_method
  yield(2)
end

# turns the symbol into a proc, then & turns the Proc into a block
my_method(&:to_s)

a_proc = :to_s.to_proc
p a_proc
my_method(&a_proc)