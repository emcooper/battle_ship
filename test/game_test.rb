require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    assert_instance_of Game, Game.new
  end 

  
end 