require './test/test_helper'
require './lib/player'
require './lib/human'

class PlayerTest < Minitest::Test
  def test_validate_ship_coordinates_returns_no_codes_for_valid_coordinates
    player = Human.new(4)
    
    assert_equal [], player.validate_ship_coordinates("A1", "A2", 2)
  end 
  
  def test_validate_ship_coordinates_returns_code_1_for_overlapping_coordinates
    player = Human.new(4)
    player.populate_fleet
    player.fleet[0].set_coordinates("A1", "A2")
    
    assert_equal [1], player.validate_ship_coordinates("A1", "C1", 3)
  end 
  
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
  
  def test_validate_ship_coordinates_returns_3_codes_for_coordinates_breaking_3_rules
    player = Human.new(4)
    player.populate_fleet
    player.fleet[0].set_coordinates("A1", "A2")
    
    assert_equal [1,2,4], player.validate_ship_coordinates("A1", "B5", 2)
    assert_equal [1,3,4], player.validate_ship_coordinates("A1", "A5", 2)
  end 
  
  def test_other_ship_coordinates_returns_array_of_coordinates
    player = Human.new(4)
    player.populate_fleet
    player.fleet[0].set_coordinates("A1", "A2")
    player.fleet[1].set_coordinates("B1", "B3")
    
    assert_equal ["A1", "A2", "B1", "B2", "B3"], player.other_ship_coordinates
  end 
  
  def test_validate_shot_returns_no_errors_for_valid_shots
    player = Human.new(4)
    
    assert_equal [], player.validate_shot("A4")
    assert_equal [], player.validate_shot("D2")
  end 
  
  def test_validate_shot_returns_5_for_off_board_shots
    player = Human.new(4)
    
    assert_equal [5], player.validate_shot("A5")
    assert_equal [5], player.validate_shot("E1")
  end 
  
  def test_validate_shot_returns_6_for_repeat_shots
    player = Human.new(4)
    player.shots = ["A1", "C3"]
    
    assert_equal [6], player.validate_shot("A1")
    assert_equal [6], player.validate_shot("C3")
  end 
  
end 
