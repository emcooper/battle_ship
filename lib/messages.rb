class Messages

  def welcome 
    "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
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
  
  def end_game_win(shots, time)
    "Congrats, you won!\n
    It took you #{shots} shots to sink your opponent's ships.\n
    The game took #{time}."
  end 
  
  def end_game_lose(shots, time)
    "Sorry, you lost.\n
    It took your opponent #{shots} shots to sink your ships.\n
    The game took #{time}."
  end
  
end 