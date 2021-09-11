def time_it
  time_before = Time.new
  yield   # execute the implicit block
  time_after = Time.new

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }

time_it { "hello world" }