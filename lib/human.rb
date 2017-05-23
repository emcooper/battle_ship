require "./lib/lib_helper"

class Human 
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
  
  
  
end 