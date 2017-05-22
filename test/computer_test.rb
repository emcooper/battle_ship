require './test/test_helper'
require './lib/computer'

class ComputerTest < Minitest::Test
  def test_it_exists
    computer = Computer.new(4)
    
    assert_instance_of Computer, computer 
    assert_equal 2, computer.fleet.count
    assert_equal Ship, computer.fleet[0].class
    assert_equal 4, computer.game_size
    assert_instance_of Board, computer.board
  end 
  
  def test_fleet_populates_with_correct_number
    assert_equal 2, Computer.new(4).populate_fleet.count 
    assert_equal 3, Computer.new(8).populate_fleet.count
    assert_equal 4, Computer.new(12).populate_fleet.count  
  end 
end 