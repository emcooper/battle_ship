require './test/test_helper'
require './lib/human'

class HumanTest < Minitest::Test
  def test_it_exists
    human = Human.new(4)
    
    assert_instance_of Human, human 
    assert_equal 2, human.fleet.count
    assert_equal Ship, human.fleet[0].class
    assert_equal 4, human.game_size
    assert_equal [], human.shots
    assert_instance_of Board, human.board
  end 
  
  def test_format_coordinates_returns_correct_format
    human = Human.new(4)
    
    assert_equal "A4", human.format_coordinates("A4 ")
    assert_equal ["A1", "C1"], human.format_coordinates(" A1   C1")
  end 
end 