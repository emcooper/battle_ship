require './test/test_helper'
require './lib/human'

class HumanTest < Minitest::Test
  def test_it_exists
    player = Human.new(4)
    
    assert_instance_of Human, player
    assert_equal [], player.ships
    assert_instance_of Board, player.offense_board
  end 
  
end 