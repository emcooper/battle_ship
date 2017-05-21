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
  
  
end 