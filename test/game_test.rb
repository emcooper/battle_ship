require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists_and_default_size_is_4
    assert_instance_of Game, Game.new
    assert_equal 4, Game.new.game_size
  end 
  
  def test_convert_difficulty_to_number_converts_correctly
    assert_equal 8, Game.new.convert_difficulty_to_number("i")
    assert_equal 12, Game.new.convert_difficulty_to_number("a")
  end 
  
  def test_format_coordinates_formates_correctly
    game = Game.new
    
    assert_equal "A4", game.format_coordinates("  A4 ")
    assert_equal ["A12", "B12"], game.format_coordinates("  A12 B12 ")
  end 
  
  def test_shot_result_returns_M_if_not_hit
    game = Game.new
    
    assert_equal ["M", nil], game.shot_result("A3", Computer.new(4))
  end 
   

  
end 