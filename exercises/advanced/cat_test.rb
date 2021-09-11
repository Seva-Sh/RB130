require 'minitest/autorun'

require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_is_cat
    
  end

  def test_name
    assert_equal('Kitty', @kitty.name)
  end

  def test_miaow
    assert(@kitty.miaow.include?(' is miaowing.'))
  end

  def test_raises_error
    assert_raises(ArgumentError) do 
      Cat.new
    end 
  end
end