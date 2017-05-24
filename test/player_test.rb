require './test/test_helper'
require './lib/player'
require './lib/human'

class PlayerTest < Minitest::Test
  def test_validate_ship_coordinates_returns_code_2_for_diagonal_coordinates
    player = Human.new(4)
    
     assert_equal [2], player.validate_ship_coordinates("A1", "B2", 2)
  end 
  
  def test_validate_ship_coordinates_returns_code_3_for_incorrect_length
    player = Human.new(4)
    
     assert_equal [3], player.validate_ship_coordinates("A1", "A4", 2)
  end 
  
  def test_validate_ship_coordinates_returns_code_4_for_not_on_board
    player = Human.new(4)
    
    assert_equal [4], player.validate_ship_coordinates("A4", "A5", 2)
  end 
  
  def test_validate_ship_coordinates_returns_no_codes_for_valid_coordinates
    player = Human.new(4)
    
    assert_equal [], player.validate_ship_coordinates("A1", "A2", 2)
  end 
end 
