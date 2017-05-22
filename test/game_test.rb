require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_default_size_is_4
    assert_instance_of Game, Game.new
    assert_equal 4, Game.new.game_size
  end 
  
  def convert_difficulty_to_number_converts_correctly
    assert_equal 8, Game.new.convert_difficulty_to_number("i")
    assert_equal 12, Game.new.convert_difficulty_to_number("a")
  end 

  
end 