require 'minitest/autorun'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open("sample_text.txt")
  end

  def test_swap
    text = Text.new(@file.read)
    new_text = text.swap('a', 'e')
    assert_equal(0, new_text.count('a'))
  end

  def test_word_count
    t = @file.read
    text = Text.new(t)
    count = t.split.count
    assert_equal(count, text.word_count)
  end

  def teardown
    @file.close
    puts  "File has been closed: #{@file.closed?}"
  end
end