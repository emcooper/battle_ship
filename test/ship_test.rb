require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test 
  def test_ship_initializes_with_correct_values
    ship = Ship.new(2)
    
    assert_equal 2, ship.size
    assert_equal ({}), ship.coordinates
    assert_nil ship.direction
    assert_equal false, ship.sunk
  end 
  
  def test_it_can_set_coordinates_of_2_unit_east_ship
    ship = Ship.new(2)
    ship.set_coordinates("A1", "A2")
    
    assert_equal ({"A1" => " ", "A2" => " "}), ship.coordinates
  end 
  
  def test_it_can_set_coordinates_of_3_unit_east_ship
    ship = Ship.new(3)
    ship.set_coordinates("A1", "A3")
    expected = {"A1" => " ", "A2" => " ", "A3" => " " }
    
    assert_equal expected, ship.coordinates
  end 
  
  def test_it_can_set_coordinates_of_4_unit_west_ship
    ship = Ship.new(4)
    ship.set_coordinates("A5", "A2")
    expected = {"A5" => " ", "A4" => " ", "A3" => " ", "A2" => " " }
    
    assert_equal expected, ship.coordinates
  end 
  
  def test_it_can_set_coordinates_of_3_unit_south_ship
    ship = Ship.new(3)
    ship.set_coordinates("B1", "D1")
    expected = {"B1" => " ", "C1" => " ", "D1" => " " }
    
    assert_equal expected, ship.coordinates
  end 
  
  def test_it_can_set_coordinates_of_3_unit_north_ship
    ship = Ship.new(3)
    ship.set_coordinates("C4", "A4")
    expected = {"C4" => " ", "B4" => " ", "A4" => " " }
    
    assert_equal expected, ship.coordinates
  end 
  
  def test_set_direction_returns_north_south_east_west
    ship = Ship.new(3)
    
    assert_equal "north", ship.set_direction("C1", "A1")
    assert_equal "south", ship.set_direction("B1", "D1")
    assert_equal "east", ship.set_direction("C1", "C3")
    assert_equal "west", ship.set_direction("A4", "A2")
  end 
  
  def test_previous_returns_previous_letter
    ship = Ship.new(3)
    
    assert_equal "A", ship.previous("B")
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