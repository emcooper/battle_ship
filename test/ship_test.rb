require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test 
  def test_ship_initializes_with_size_blank_coordinates_and_sunk_equals_false
    ship = Ship.new(2)
    
    assert_equal 2, ship.size
    assert_equal ({}), ship.coordinates
    assert_equal false, ship.sunk
  end 
  
  def test_it_can_set_coordinates
    ship = Ship.new(2)
    ship.set_coordinates(["A1", "A2"])
    
    assert_equal ({"A1" => " ", "A2" => " "}), ship.coordinates
  end 
  
  def test_validate_puts_error_for_wrong_number_of_coordinates
    ship = Ship.new(2)
    
    expected = "Wrong number of coordinates!\n"
    
    assert_output(expected){ship.validate(["A1", "A2", "A2"])}
    assert_output(expected){ship.validate(["A1"])}
  end 
  
  
end 