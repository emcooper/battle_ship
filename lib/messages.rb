require 'colorize'
class Messages

  def welcome 
    "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?".blue
  end 
  
  def instructions 
    "The basic object of the game of Battleship is to hide your ship fleet \n
    somewhere on your grid and by calling out basic coordinates, \n
    find your opponent’s fleet before they find yours. You will take turns\n
    selecting coordinates to 'hit'. When all coordinates of a ship have been\n
    hit the ship has been 'sunk'. The first person to sink all of the other player's\n
    ships wins the game.\n
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end 
  
  def game_difficulty_prompt
    "Would you like to play a Beginner(b), Intermediate(i), or Advanced(a) game?"
  end 
  
  def computer_ship_placement_prompt()
    "I have laid out my ships on the grid.\n
    You now need to layout your two ships.\n
    The first is two units long and the\n
    second is three units long.\n
    The grid has A1 at the top left and D4 at the bottom right."
  end 
  
  def human_ship_placement_prompt(ship_length)
    "Please enter coordinates for your #{ship_length}-unit ship:"
  end 
  
  def additional_ship_prompt(size)
    "Enter the squares for the #{size}-unit ship:"
  end 
  
  def player_board_title
    "Your shots:"
  end 
  
  def computer_board_title
    "The computer's shots:"
  end 
  
  def proceed
    "press enter to proceed"
  end 
  
  def fire_prompt
    "Enter coordinate to fire on:"
  end  
    
  def invalid_coordinate
    "Your coordinate is not valid. Please choose a coordinate on the above grid."
  end 
  
  def invalid_double_hit
    "You've already fired on this coordinate. Please choose another:"
  end 
  
  def player_hit
    "You got a hit!"
  end 
  
  def player_miss 
    "That was a miss, better luck next time."
  end 
  
  def player_sink(size)
    "You sunk a #{size}-unit ship!"
  end 
  
  def computer_shot(position, result) 
    "The computer fired at #{position}. It was a #{result}!"
  end 
  
  def computer_sink(size)
    "The Computer sunk your #{size}-unit ship!"
  end 
  
  def end_game_win(shots, time)
    "Congrats, you won!\nIt took you #{shots} shots to sink your opponent's ships.\nThe game took #{time}."
  end 
  
  def end_game_lose(shots, time)
    "Sorry, you lost.\n
    It took your opponent #{shots} shots to sink your ships.\n
    The game took #{time}."
  end
  
  def print_errors(error_codes)
    puts "No Overlapping Ships!" if error_codes.include?(1)
    puts "Ships must be horizontal or vertical!" if error_codes.include?(2)
    puts "Coordinates do not match ship length!" if error_codes.include?(3)
    puts "Coordinates do not fall on the board!" if error_codes.include?(4)
    puts "Shot coordinate does not fall on the board! Try again:" if error_codes.include?(5)
    puts "You already shot at this coordinate. No Repeats! Try again:" if error_codes.include?(6)
  end 
  
end 