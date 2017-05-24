require './lib/player'
require './lib/ship'
require './lib/board'

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

  
  
  
end 