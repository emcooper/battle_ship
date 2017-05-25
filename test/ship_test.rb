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

  def test_it_sets_hit_on_given_coordinate_and_not_others
    ship = Ship.new(3)
    ship.set_coordinates("C4", "A4")
    ship.hit("B4")
    
    assert_equal "H", ship.coordinates["B4"]
    assert_equal " ", ship.coordinates["C4"]
    assert_equal " ", ship.coordinates["A4"]
  end 
  
  def test_hit_changes_sunk_to_true_when_all_coordinates_hit
    ship = Ship.new(3)
    ship.set_coordinates("C4", "A4")
    ship.hit("B4")
    ship.hit("C4")
    
    assert_equal false, ship.sunk
    
    ship.hit("A4")
    
    assert_equal true, ship.sunk
  end 
  
  def test_check_if_sunk_sets_sunk_correctly
    ship = Ship.new(3)
    ship.set_coordinates("A1", "A3")
    ship.hit("A2")
    ship.hit("A3")
    ship.check_if_sunk
    
    assert_equal false, ship.sunk
    
    ship.hit("A1")
    ship.check_if_sunk
    
    assert_equal true, ship.sunk
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
end 