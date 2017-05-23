require 'pry'
require './lib/ship'
require './lib/board'


class Computer  
  attr_reader :game_size, :fleet, :board
  def initialize(game_size)
    @game_size = game_size
    @fleet = populate_fleet
    @board = Board.new(game_size)
  end 
  
  def populate_fleet
    ships = [Ship.new(2)]
    ships << Ship.new(3)
    ships << Ship.new(4) if @game_size > 4 
    ships << Ship.new(5) if @game_size > 8
    ships
  end 
  
  def place_all_ships
    @fleet.each do |ship|
      place_ship(ship)
    end 
  end 
  
  def place_ship(ship)
    direction = random_direction
    first_coordinate = random_coordinate(direction, ship)
    # todo: check it doesn't intersect with other ship
    last_coordinate = last_coordinate(first_coordinate, ship.size, direction)
    ship.set_coordinates(first_coordinate, last_coordinate)  
  end 
  
  def random_coordinate(direction, ship)
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
    return @board.rows.sample if direction == "east"
    return @board.rows[0..@game_size-ship.size].sample if direction == "south"
  end 
  
  def random_column(direction, ship)
    return @board.columns.sample if direction == "south"
    return @board.columns[0..@game_size-ship.size].sample if direction == "east"
  end 
end 

computer = Computer.new(4)

computer.place_ship(computer.fleet[0])

puts computer.fleet[0].coordinates
