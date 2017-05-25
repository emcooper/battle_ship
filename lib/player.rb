require 'pry'
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
    error_codes << 1 if overlapping_ships?(first, last)
    error_codes << 2 if diagonal?(first, last)
    error_codes << 3 if wrong_length?(first, last, ship_length)
    error_codes << 4 if off_board?(first, last)
    error_codes
  end 
  
  def validate_shot(shot)
    error_codes = []
    error_codes << 5 if off_board?(shot)
    error_codes << 6 if @shots.include?(shot)
    error_codes
  end 
  
  def overlapping_ships?(first, last)
    !(all_coordinates(first, last) & other_ship_coordinates).empty?
  end 
  
  def wrong_length?(first, last, ship_length)
    return true if horizontal_wrong_length?(first, last, ship_length) || 
    vertical_wrong_length?(first, last, ship_length)
  end 
  
  def diagonal?(first, last)
    (row(first) != row(last)) && (column(first) != column(last))
  end 
  
  def off_board?(first, last = "A1")
    return true if first == ""
    numerical_rows_and_columns(first, last).any? {|number| number > @game_size}
  end 
  
  def horizontal_wrong_length?(first, last, ship_length)
    row(first) == row(last) && (column(first) - column(last)).abs + 1 != ship_length
  end 
  
  def vertical_wrong_length?(first, last, ship_length)
    column(first) == column(last) && (row(first).ord - row(last).ord).abs + 1 != ship_length
  end 
  
  def other_ship_coordinates
    (@fleet.map {|ship| ship.coordinates.keys}).flatten
  end 
  
  def all_coordinates(first, last)
    row = row(first)
    column = column(first)
    direction = set_direction(first, last)
    coordinates = []
    if direction == "east"
      until column > column(last)
        coordinates << format_coordinate(row, column)
        column += 1
      end 
    elsif direction == "west"
      until column < column(last)
        coordinates << format_coordinate(row, column)
        column -= 1
      end 
    elsif direction == "south"
      until row > row(last)
        coordinates << format_coordinate(row, column)
        row = row.next
      end 
    elsif direction == "north"
      until row < row(last)
        coordinates << format_coordinate(row, column)
        row = previous(row)
      end   
    end 
    coordinates.flatten
  end 
  
  def format_coordinate(row, column)
    row + column.to_s
  end 
  
  def previous(letter)
    (letter.ord - 1).chr
  end 
  
  def set_direction(first, last)
      return "east" if column(first) < column(last)
      return "west" if column(first) > column(last)
      return "south" if row(first) < row(last)
      return "north" if row(first) > row(last) 
  end 
  
  def numerical_rows_and_columns(first, last)
    [row(first).ord - 64, row(last).ord - 64, column(first), column(last)]
  end 
  
  def row(coordinate)
    coordinate[0]
  end 
  
  def column(coordinate)
    coordinate[1..3].to_i
  end 

end  