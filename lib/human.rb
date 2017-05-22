class Human 
  attr_reader :ships, :offense_board
  def initialize(game_size)
    @ships = []
    @offense_board = Board.new(game_size)
  end 
  
end 