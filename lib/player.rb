module Player

  def populate_fleet
    ships = [Ship.new(2)]
    ships << Ship.new(3)
    ships << Ship.new(4) if @game_size > 4 
    ships << Ship.new(5) if @game_size > 8
    ships
  end 
  
  def validate_ship_coordinates(first, last, ship_length)
    error_codes = []
    
    #no overlapping (1)
    
    #only horizontal or vertical (2)
    error_codes << 2 if diagonal?(first, last)
    #correct length (3)
    error_codes << 3 if wrong_length?(first, last, ship_length)
    #on board? (4)
    error_codes << 4 if off_board?(first, last, ship_length)
    #return error_codes
    error_codes
  end 
  
  def wrong_length?(first, last, ship_length)
    if row(first) == row(last) && (column(first) - column(last)).abs + 1 != ship_length
      return true
    elsif column(first) == column(last) && (row(first).ord - row(last).ord).abs + 1 != ship_length
      return true
    end
  end 
   
  def diagonal?(first, last)
    (row(first) != row(last)) && (column(first) != column(last))
  end 
  
  def off_board?(first, last, ship_length)
    numerical_rows_and_columns(first, last).any? {|number| number > @game_size}
  end 
  
  def numerical_rows_and_columns(first, last)
    [row(first).ord - 64, row(last).ord - 64, column(first), column(last)]
  end 

  def validate_shot
    
  end 
  
  def row(coordinate)
    coordinate[0]
  end 
  
  def column(coordinate)
    coordinate[1..3].to_i
  end 

end  