require 'pry'
require "./lib/lib_helper"

class Game
  attr_reader :game_size
  def initialize
    @messager = Messages.new
    @game_size = 4
    @computer = nil
    @human = nil
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
    @computer = Computer.new(@game_size)
    @human = Human.new(@game_size)
    @computer.place_all_ships
    puts @messager.computer_ship_placement_prompt
    place_all_human_ships

    
    #set ship 
  end 

  def place_all_human_ships
    @human.fleet.each do |ship|
      puts @messager.human_ship_placement_prompt(ship.size)
      coordinates = format_coordinates(get_input)
      ship.set_coordinates(coordinates[0], coordinates[1])
    end 
  end 
  
  def convert_difficulty_to_number(difficulty)
    return 4 if difficulty.downcase == "b"
    return 8 if difficulty.downcase == "i"
    return 12 if difficulty.downcase == "a"
  end 
  
  def format_coordinates(input)
    separated = input.split(" ")
    separated = separated.join if separated.count < 2
    return separated
  end 
  #end
  

end 