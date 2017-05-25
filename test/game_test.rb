require './test/test_helper'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new
    
    assert_instance_of Game, game
    assert_instance_of Messages, game.messager
    assert_equal 4, game.game_size
    assert_nil game.computer
    assert_instance_of Human, game.human
    assert_equal ({"start" => nil,"end" => nil}), game.timer
  end 
  
  def test_create_players_creates_human_and_computer
    game = Game.new
    game.create_players
    
    assert_equal 4, game.computer.game_size
    assert_equal 4, game.human.game_size
  end 
  
  def test_bottom_right_coordinate_return_coordinate
    assert_equal "D4", Game.new.bottom_right_coordinate
  end 
  
  def test_convert_difficulty_to_number_converts_correctly
    assert_equal 8, Game.new.convert_difficulty_to_number("i")
    assert_equal 12, Game.new.convert_difficulty_to_number("a")
    assert_equal 4, Game.new.convert_difficulty_to_number("z")
  end  
  
  def test_format_coordinates_formates_correctly
    game = Game.new
    
    assert_equal "A4", game.format_coordinates("  A4 ")
    assert_equal ["A12", "B12"], game.format_coordinates("  A12 B12 ")
  end 
  
  def test_shot_result_returns_M_if_not_hit
    game = Game.new
    
    assert_equal ["M", nil], game.shot_result("A3", Computer.new(4))
  end 

  def test_game_time_returns_string
     game = Game.new
     game.start_timer
     game.end_timer
     
     assert_instance_of String, game.game_time
  end   
end 