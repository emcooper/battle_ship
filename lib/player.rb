module Player

  def populate_fleet
    ships = [Ship.new(2)]
    ships << Ship.new(3)
    ships << Ship.new(4) if @game_size > 4 
    ships << Ship.new(5) if @game_size > 8
    ships
  end 


end  