require './test/test_helper'
require './lib/messages'

class MessagesTest < Minitest::Test
  
  def test_welcome_returns_welcome_message
    expected = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?".blue
    actual = Messages.new.welcome
    
    assert_equal expected, actual
  end 
  
  def test_instructions_returns_instructions
    expected ="The basic object of the game of Battleship is to hide your ship fleet
somewhere on your grid and by calling out basic coordinates,
find your opponent’s fleet before they find yours. You will take turns
selecting coordinates to 'hit'. When all coordinates of a ship have been
hit the ship has been 'sunk'. The first person to sink all of the other player's
ships wins the game.\n
Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    actual = Messages.new.instructions
    
    assert_equal expected, actual
  end 
  
  def test_game_difficulty_prompt_returns_prompt
    expected = "Would you like to play a Beginner(b), Intermediate(i), or Advanced(a) game?\n"
    actual = Messages.new.game_difficulty_prompt
    
    assert_equal expected, actual
  end 
  
  def test_computer_ship_placement_returns_prompt
    expected = "I have laid out my ships on the grid.You now need to layout your two ships. 
The first is two units long and the second is three units long. 
The grid has A1 at the top left and L12 at the bottom right.\n"
    actual = Messages.new.computer_ship_placement("L12")
    
    assert_equal expected, actual
  end 
  
  def test_human_ship_placement_prompt_returns_prompt
    expected = "Please enter coordinates for your 4-unit ship:\n"
    actual = Messages.new.human_ship_placement_prompt(4)
    
    assert_equal expected, actual
  end 
  
  def test_human_board_title
    expected = "Your shots:".light_white.on_black
    actual = Messages.new.human_board_title
    
    assert_equal expected, actual
  end 
  
  def test_computer_board_title
    expected = "The computer's shots:".light_white.on_red
    actual = Messages.new.computer_board_title
    
    assert_equal expected, actual
  end
  
  def test_proceed_returns_prompt
    expected = "Press enter to proceed:\n"
    actual = Messages.new.proceed
    
    assert_equal expected, actual
  end 
  
  def test_fire_prompt_returns_prompt
    expected = "Enter coordinate to fire on:\n"
    actual = Messages.new.fire_prompt
    
    assert_equal expected, actual
  end 
  
  def test_player_hit_returns_congrats
    expected = "You got a hit!\n".green
    actual = Messages.new.player_hit
    
    assert_equal expected, actual
  end 
  
  def test_player_miss_returns_condolences
    expected = "That was a miss, better luck next time."
    actual = Messages.new.player_miss
    
    assert_equal expected, actual
  end 
  
  def test_player_sink_returns_congrats_with_size
    expected = "You sunk a 3-unit ship!".green
    actual = Messages.new.player_sink(3)
    
    assert_equal expected, actual
  end 
  
  def test_computer_shot_returns_message
    expected = "The computer fired at A3. It was a hit!"
    actual = Messages.new.computer_shot("A3", "hit") 
    
    assert_equal expected, actual
  end 
  
  def test_computer_sink_returns_message
    expected = "The Computer sunk your 5-unit ship!"
    actual = Messages.new.computer_sink(5)
    
    assert_equal expected, actual
  end 
  
  def test_end_game_win_returns_message_with_shots_and_time
    expected = "Congrats, you won!\n
It took you 8 shots to sink your opponents' ships.\n
The game took 2 minutes and 30 seconds.".magenta
    actual = Messages.new.end_game_win(8, "2 minutes and 30 seconds")
    
    assert_equal expected, actual
  end 
  
  def test_end_game_lose_returns_message_with_shots_and_time
    expected = "Sorry, you lost.\n
It took your opponent 10 shots to sink your ships.\n
The game took 4 minutes and 17 seconds.".magenta
    actual = Messages.new.end_game_lose(10, "4 minutes and 17 seconds")
    
    assert_equal expected, actual
  end 
  
end 