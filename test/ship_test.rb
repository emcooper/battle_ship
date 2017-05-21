require './test/test_helper'
require './lib/ship'

class ShipTest < Minitest::Test 
  def test_ship_initializes_with_size_coordinates_and_sunk_equals_false
    ship = Ship.new(2, ["A1", "A2"])
    
    assert_equal 2, ship.size
    assert_equal ["A1", "A2"], ship.coordinates
    assert_equal false, ship.sunk
  end 
  
  
end 