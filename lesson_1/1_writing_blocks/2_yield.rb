def hello
  "hello!"
end

p hello {puts 'hi'}

def echo(str)
  str
end

# p echo {puts "world"} Error, given 0 expected 1
p echo("hello!") {puts 'world'} # works fine


def echo_with_yield(str)
  yield if block_given?
  str
end

# echo_with_yield {puts "world"} Error Wrong number of arguments
p echo_with_yield("hello!") {puts "world"}
p echo_with_yield("hello")
