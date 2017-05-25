require 'colorize'

class Messages
  def welcome 
    `Say "Welcome to BATTLESHIP"`
    "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?".blue
  end 
  
  def instructions 
    "The basic object of the game of Battleship is to hide your ship fleet
somewhere on your grid and by calling out basic coordinates,
find your opponent’s fleet before they find yours. You will take turns
selecting coordinates to 'hit'. When all coordinates of a ship have been
hit the ship has been 'sunk'. The first person to sink all of the other player's
ships wins the game.\n
Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end 
  
  def game_difficulty_prompt
    "Would you like to play a Beginner(b), Intermediate(i), or Advanced(a) game?\n"
  end 
  
  def computer_ship_placement(bottom_right_coordinate)
    "I have laid out my ships on the grid.You now need to layout your two ships. 
The first is two units long and the second is three units long. 
The grid has A1 at the top left and #{bottom_right_coordinate} at the bottom right.\n"
  end 
  
  def human_ship_placement_prompt(ship_length)
    "Please enter coordinates for your #{ship_length}-unit ship:\n"
  end 
  
  def human_board_title
    "Your shots:".light_white.on_black
  end 
  
  def computer_board_title
    "The computer's shots:".light_white.on_red
  end 
  
  def proceed
    "Press enter to proceed:\n"
  end 
  
  def fire_prompt
    "Enter coordinate to fire on:\n"
  end  
  
  def player_hit
    "You got a hit!\n".green
  end 
  
  def player_miss 
    "That was a miss, better luck next time."
  end 
  
  def player_sink(size)
    "You sunk a #{size}-unit ship!".green
  end 
  
  def computer_shot(position, result) 
    "The computer fired at #{position}. It was a #{result}!"
  end 
  
  def computer_sink(size)
    "The Computer sunk your #{size}-unit ship!"
  end 
  
  def end_game_win(shots, time)
    "Congrats, you won!\n\nIt took you #{shots} shots to sink your opponents' ships.\n\nThe game took #{time}.".magenta
  end 
  
  def end_game_lose(shots, time)
    "Sorry, you lost.\n\nIt took your opponent #{shots} shots to sink your ships.\n\nThe game took #{time}.".magenta
  end
  
  def print_errors(error_codes)
    puts "No Overlapping Ships!".red if error_codes.include?(1)
    puts "Ships must be horizontal or vertical!".red if error_codes.include?(2)
    puts "Coordinates do not match ship length!".red if error_codes.include?(3)
    puts "Coordinates do not fall on the board!".red if error_codes.include?(4)
    puts "Shot coordinate does not fall on the board! Try again:".red if error_codes.include?(5)
    puts "You already shot at this coordinate. No Repeats! Try again:".red if error_codes.include?(6)
  end 
end 