require './lib/player'
require './lib/ship'
require './lib/board'
require './lib/messages'

class Human 
  include Player
  attr_reader :game_size, :fleet, :board
  attr_accessor :shots
  def initialize(game_size)
    @game_size = game_size
    @fleet = populate_fleet
    @board = Board.new(game_size)
    @messager = Messages.new
    @shots = []
  end 

  def place_all_ships
    @fleet.each do |ship|
      place_ship(ship)
    end 
  end 
  
  def place_ship(ship)
    while ship.coordinates.empty? 
      puts @messager.human_ship_placement_prompt(ship.size)
      coordinates = format_coordinates(get_input)
      valid = validate_ships(coordinates, ship.size).empty?
      ship.set_coordinates(coordinates[0], coordinates[1]) if valid
    end 
  end 
  
  def validate_ships(coordinates, ship_size)
    error_codes = validate_ship_coordinates(coordinates[0], coordinates[1], ship_size)
    @messager.print_errors(error_codes)
    return error_codes
  end 
  
  def get_player_shot
    current_shot_count = @shots.count
    while current_shot_count == @shots.count
      shot = ask_for_shot
    end 
    shot
  end 
  
  def ask_for_shot
    shot = format_coordinates(get_input)
    error_codes = validate_shot(shot)
    @messager.print_errors(error_codes)
    @shots << shot if error_codes.empty?
    return shot if error_codes.empty?
  end 
  
  def format_coordinates(input)
    separated = input.split(" ")
    separated = separated.join if separated.count < 2
    return separated
  end 

  def enter_for_next
    puts @messager.proceed
    get_input
  end 

  def get_input
    print ">"
    gets.chomp
  end 
end 