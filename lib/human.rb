require 'pry'
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
    @shots = []
  end 

  def place_all_ships
    @messager = Messages.new
    @fleet.each do |ship|
      #while ship has empty coordinates, keep looping
      while ship.coordinates.empty? 
        puts @messager.human_ship_placement_prompt(ship.size)
        coordinates = format_coordinates(get_input)
        valid = validate(coordinates, ship.size).empty?
        ship.set_coordinates(coordinates[0], coordinates[1]) if valid
      end 
    end 
  end 
  
  def validate(coordinates, ship_size)
    error_codes = validate_ship_coordinates(coordinates[0], coordinates[1], ship_size)
    #have messager print appropriate errors
    @messager.print_errors(error_codes)
    return error_codes
  end 
  
  def format_coordinates(input)
    separated = input.split(" ")
    separated = separated.join if separated.count < 2
    return separated
  end 

  def get_input
    print ">"
    gets.chomp
  end 

end 