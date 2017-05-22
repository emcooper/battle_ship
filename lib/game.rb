require "./lib/messages"

class Game
  attr_reader :game_size
  def initialize
    @messager = Messages.new
    @game_size = 4
  end 
  
  #start
  def start 
    puts @messager.welcome
    input = get_input
    while input != "p" && input != "q"
      puts @messager.instructions if input == "i" 
      input = get_input
    end 
    play if input == "p"
  end 
  
  def get_input
    print ">"
    gets.chomp
  end 
  
  #play
  def play 
    puts @messager.game_difficulty_prompt
    @game_size = convert_difficulty_to_number(get_input)
    puts @messager.ship_placement_prompt
    place_ships
    #set ship 
  end 
  
  def place_ships
    ship_coordinates = get_input
    first = format_2_coordinate_input[ship_coordinates]
    last = format_2_coordinate_input[ship_coordinates]
    #place ships
  end 
  
  def convert_difficulty_to_number(difficulty)
    return 4 if difficulty.downcase == "b"
    return 8 if difficulty.downcase == "i"
    return 12 if difficulty.downcase == "a"
  end 
  
  def format_2_coordinate_input(input)
    [input.delete(" ")[0..1], input.delete(" ")[2..3]]
  end 
  #end
  

end 