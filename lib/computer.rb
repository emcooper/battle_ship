require 'pry'
require './lib/player'
require './lib/ship'
require './lib/board'

class Computer  
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
    @fleet.each do |ship|
      place_ship(ship) while ship.coordinates.empty? 
    end 
  end 
  
  def place_ship(ship)
    direction = random_direction
    first_coordinate = random_coordinate(direction, ship)
    last_coordinate = last_coordinate(first_coordinate, ship.size, direction)
    valid = validate_ship_coordinates(first_coordinate, last_coordinate, ship.size).empty?
    ship.set_coordinates(first_coordinate, last_coordinate) if valid
  end 
  
  def random_coordinate(direction = "none", ship = "none")
    random_row(direction, ship) + random_column(direction, ship).to_s
  end 
  
  def last_coordinate(first_coordinate, ship_length, direction)
    if direction == "east"
      return first_coordinate[0] + (first_coordinate[1..3].to_i + ship_length-1).to_s
    elsif direction == "south"
      return (first_coordinate[0].ord + ship_length-1).chr + first_coordinate[1..3]
    end 
  end 
  
  def random_direction
    ["south", "east"].sample
  end 
  
  def random_row(direction, ship)
    return @board.rows.sample if direction == "east" || direction == "none"
    return @board.rows[0..@game_size-ship.size].sample if direction == "south"
  end 
  
  def random_column(direction, ship)
    return @board.columns.sample if direction == "south" || direction == "none"
    return @board.columns[0..@game_size-ship.size].sample if direction == "east"
  end 
end 

