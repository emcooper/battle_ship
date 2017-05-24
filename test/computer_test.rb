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
  
  def test_random_direction_returns_direction
    computer = Computer.new(4)
    
    assert_includes ["south", "east"], computer.random_direction
    assert_instance_of String, computer.random_direction
  end 
  
  def test_random_row_returns_valid_row
    computer = Computer.new(4)
    
    assert_includes ["A", "B", "C", "D"], computer.random_row("east", Ship.new(2))
    assert_includes ["A", "B", "C"], computer.random_row("south", Ship.new(2))
  end 
  
  def test_random_column_returns_valid_column
    computer = Computer.new(4)
    
    assert_includes [1, 2, 3, 4], computer.random_column("south", Ship.new(2))
    assert_includes [1, 2, 3], computer.random_column("east", Ship.new(2))
  end 
  
  def test_random_coordinate_returns_coordinate
    computer = Computer.new(4)
    
    assert_includes ["A", "B", "C", "D"], computer.random_coordinate("south", Ship.new(2))[0]
    assert_includes [1, 2, 3, 4], computer.random_coordinate("south", Ship.new(2))[1].to_i
  end 
  
  def test_last_coordinate_returns_correct_coordinate
    computer = Computer.new(4)
    
    assert_equal "A2", computer.last_coordinate("A1", 2, "east")
    assert_equal "D1", computer.last_coordinate("B1", 3, "south")
  end 
  
  def test_place_ship_sets_coordinates_for_2_unit_ship
    computer = Computer.new(4)
    
    computer.place_ship(computer.fleet[0])
    
    assert_equal 2, computer.fleet[0].coordinates.count
  end 
  
  def test_place_ship_sets_coordinates_for_4_unit_ship
    computer = Computer.new(8)
    computer.place_ship(computer.fleet[2])
    
    assert_equal 4, computer.fleet[2].coordinates.count
  end 
  
  def test_place_ship_sets_coordinates_for_5_unit_ship
    computer = Computer.new(12)
    computer.place_ship(computer.fleet[3])
    
    assert_equal 5, computer.fleet[3].coordinates.count
  end 
  
  def test_place_all_ships_sets_coordinates_for_all_ships_for_12_size_board
    computer = Computer.new(12)
    computer.place_all_ships
    
    assert_equal 2, computer.fleet[0].coordinates.count
    assert_equal 3, computer.fleet[1].coordinates.count
    assert_equal 4, computer.fleet[2].coordinates.count
    assert_equal 5, computer.fleet[3].coordinates.count
  end 
  
end 