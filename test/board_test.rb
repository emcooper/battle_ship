require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_initializes_with_length
    board = Board.new(4)
    
    assert_equal 4, board.length
  end
  
  def test_length_can_only_be_integer
    board = Board.new('4')
    refute board.length
    
    board = Board.new(4.75)
    refute board.length
    
    board = Board.new(false)
    refute board.length  
  end 
  
  def test_blank_grid_generates_hash_of_letters_and_arrays
    board = Board.new(4)
    
    expected_keys = ["*","A", "B", "C", "D"]
    expected_values = [[1, 2, 3, 4],[" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "]]
    
    assert_instance_of Hash, board.blank_grid(4)
    assert_equal expected_keys, board.blank_grid(4).keys
    assert_equal expected_values, board.blank_grid(4).values
  end 
  
  def test_blank_grid_generates_bigger_grid
    board = Board.new(8)
    
    expected_keys = ["*","A", "B", "C", "D", "E", "F", "G", "H"]
    expected_values = [[1, 2, 3, 4, 5, 6, 7, 8],[" "]*8, [" ", " ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " ", " "], [" ", " ", " ", " ", " ", " ", " ", " "]]
    
    assert_instance_of Hash, board.blank_grid(8)
    assert_equal expected_keys, board.blank_grid(8).keys
    assert_equal expected_values, board.blank_grid(8).values
  end 
  
  def test_board_initializes_with_blank_grid_of_length
    board = Board.new(4)
    
    assert_equal 5, board.grid.length
    assert_equal [1,2,3,4], board.grid["*"]
    assert_equal [" ", " ", " ", " "], board.grid.values[1..4].uniq.flatten
  end 
  
  
  def test_record_shot_sets_hits_in_given_coordinate_only
    board = Board.new(4)
    board.record_shot("H", "B3")
    
    assert_equal "H", board.grid["B"][2]
    assert_equal 15, board.grid.flatten(2).count(" ")
  end 
  
  def test_record_shot_sets_misses_in_given_coordinate_only
    board = Board.new(4)
    board.record_shot("M", "C4")
    
    assert_equal "M", board.grid["C"][3]
    assert_equal 15, board.grid.flatten(2).count(" ")
  end 
  
  def test_record_shot_sets_multiple_misses_and_shots_in_given_coordinate_only
    board = Board.new(4)
    board.record_shot("M", "C4")
    board.record_shot("H", "A1")
    board.record_shot("M", "D3")
    board.record_shot("H", "B2")
    
    assert_equal "M", board.grid["C"][3]
    assert_equal "H", board.grid["A"][0]
    assert_equal "M", board.grid["D"][2]
    assert_equal "H", board.grid["B"][1]
    assert_equal 12, board.grid.flatten(2).count(" ")
  end
  
  def test_record_shot_will_not_record_invalid_shot_result
    board = Board.new(4)
    board.record_shot("S", "C4")
    board.record_shot(5, "B2")
    
    assert_equal " ", board.grid["C"][3]
    assert_equal " ", board.grid["B"][1]
  end 
  
  def test_record_shot_will_not_record_invalid_coordinate_input
    board = Board.new(4)
    board.record_shot("M", "G8")
    
    assert_equal 16, board.grid.flatten(2).count(" ")
  end 
   
end 