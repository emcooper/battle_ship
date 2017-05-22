require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test 
  def test_ship_initializes_with_correct_values
    ship = Ship.new(2)
    
    assert_equal 2, ship.size
    assert_equal ({}), ship.coordinates
    assert_nil ship.orientation
    assert_equal false, ship.sunk
  end 
  
  def test_it_can_set_coordinates_of_2_unit_ship
    ship = Ship.new(2)
    ship.set_coordinates("A1", "A2")
    
    assert_equal ({"A1" => " ", "A2" => " "}), ship.coordinates
  end 
  
  def test_it_can_set_coordinates_of_3_unit_ship
    skip 
    ship = Ship.new(3)
    ship.set_coordinates(["A1", "A3"])
    expected = {"A1" => " ", "A2" => " ", "A3" => " " }
    
    assert_equal expected, ship.coordinates
  end 
  
  def test_it_sets_horizontal_orientation
    ship = Ship.new(3)
    ship.set_orientation("A1", "A3")
    
    assert_equal "horizontal", ship.orientation
  end 
  
  def test_it_sets_vertical_orientation
    ship = Ship.new(3)
    ship.set_orientation("C1", "A1")
    
    assert_equal "vertical", ship.orientation
  end 
  
  def test_direction_returns_north_south_east_west
    ship = Ship.new(3)
    
    assert_equal "north", ship.direction("C1", "A1")
    assert_equal "south", ship.direction("B1", "D1")
    assert_equal "east", ship.direction("C1", "C3")
    assert_equal "west", ship.direction("A4", "A2")
  end 
  
  def test_row_returns_row
    ship = Ship.new(3)
    
    assert_equal "B", ship.row("B2")
  end 
  
  def test_column_returns_column
    ship = Ship.new(3)
    
    assert_equal 4, ship.column("C4")
  end 
  
  def test_print_error_prints_error_based_on_error_code
    ship = Ship.new(2)
    
    expected_1 = "You gave coordinates for the wrong ship size. Please try again: \n"
    expected_3 = "Your ship cannot overlap with your other ships. Please try again: \n"
    
    assert_output(expected_1){ship.print_error(1)}
    assert_output(expected_3){ship.print_error(3)}
  end 
  
  
  
end 