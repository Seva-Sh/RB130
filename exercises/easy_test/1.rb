require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class NewTest < Minitest::Test
  def test_odd
    assert_equal(false, !value.odd?)
  end
end