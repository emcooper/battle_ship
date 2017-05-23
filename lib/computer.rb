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
  
  def place_ship(ship)
    # choose direction
    direction = random_direction
    # choose random coordinate w/ in limited range
    if direction == "east"
      row = random_row
    end 
    #find end coordinate
    #pass to Ship set_coordinates
    
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
puts computer.random_column("east", computer.fleet[0])
