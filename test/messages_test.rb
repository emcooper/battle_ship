require './test/test_helper'
require './lib/messages'

class MessagesTest < Minitest::Test
  
  def test_welcome_returns_welcome_message
    expected = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    actual = Messages.new.welcome
    
    assert_equal expected, actual
  end 
  
  def test_instructions_returns_instructions
    expected = "The basic object of the game of Battleship is to hide your ship fleet \n
    somewhere on your grid and by calling out basic coordinates, \n
    find your opponent’s fleet before they find yours. You will take turns\n
    selecting coordinates to 'hit'. When all coordinates of a ship have been\n
    hit the ship has been 'sunk'. The first person to sink all of the other player's\n
    ships wins the game.\n
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    actual = Messages.new.instructions
    
    assert_equal expected, actual
  end 
  
  def test_game_size_prompt_returns_prompt
    expected = "Would you like to play a Beginner(b), Intermediate(i), or Advanced(a) game?"
    actual = Messages.new.game_difficulty_prompt
    
    assert_equal expected, actual
  end 
  
  def test_ship_placement_prompt_returns_prompt
    expected = "I have laid out my ships on the grid.\n
    You now need to layout your two ships.\n
    The first is two units long and the\n
    second is three units long.\n
    The grid has A1 at the top left and D4 at the bottom right.\n\n
    Enter the squares for the two-unit ship:"
    actual = Messages.new.ship_placement_prompt
    
    assert_equal expected, actual
  end 
  
  def test_fire_prompt_returns_prompt
    expected = "Enter coordinate to fire on:"
    actual = Messages.new.fire_prompt
    
    assert_equal expected, actual
  end 
  
  def test_invalid_coordinate_returns_prompt
    expected = "Your coordinate is not valid. Please choose a coordinate on the above grid."
    actual = Messages.new.invalid_coordinate
    
    assert_equal expected, actual
  end 
  
  def test_invalid_double_hit_returns_prompt
    expected = "You've already fired on this coordinate. Please choose another:"
    actual = Messages.new.invalid_double_hit
    
    assert_equal expected, actual
  end 
  
  def test_player_hit_returns_congrats
    expected = "You got a hit!"
    actual = Messages.new.player_hit
    
    assert_equal expected, actual
  end 
  
  def test_player_miss_returns_condolences
    expected = "That was a miss, better luck next time."
    actual = Messages.new.player_miss
    
    assert_equal expected, actual
  end 
  
  def test_player_sink_returns_congrats_with_size
    expected = "You sunk a 3-unit ship!"
    actual = Messages.new.player_sink(3)
    
    assert_equal expected, actual
  end 
  
  def test_end_game_win_returns_message_with_shots_and_time
    expected = "Congrats, you won!\n
    It took you 8 shots to sink your opponent's ships.\n
    The game took 2 minutes and 30 seconds."
    actual = Messages.new.end_game_win(8, "2 minutes and 30 seconds")
    
    assert_equal expected, actual
  end 
  
  def test_end_game_lose_returns_message_with_shots_and_time
    expected = "Sorry, you lost.\n
    It took your opponent 10 shots to sink your ships.\n
    The game took 4 minutes and 17 seconds."
    actual = Messages.new.end_game_lose(10, "4 minutes and 17 seconds")
    
    assert_equal expected, actual
  end 
  
end 