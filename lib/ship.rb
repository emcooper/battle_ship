class Ship
  attr_reader :size, :coordinates, :direction, :sunk
  def initialize(size)
    @size = size
    @coordinates = {}
    @direction = nil
    @sunk = false
  end 
  
  def set_coordinates(first, last)
    #validated_input = vaidate(coordinates_input) if vaidate(coordinates_input)
    @direction = set_direction(first, last)
    row = row(first)
    column = column(first)
    if @direction == "east"
      until column > column(last)
        @coordinates[row + column.to_s] = " "
        column += 1
      end 
    elsif @direction == "west"
      until column < column(last)
        @coordinates[row + column.to_s] = " "
        column -= 1
      end 
    elsif @direction == "south"
      until row > row(last)
        @coordinates[row + column.to_s] = " "
        row = row.next
      end 
    elsif @direction == "north"
      until row < row(last)
        @coordinates[row + column.to_s] = " "
        row = previous(row)
      end   
    end 
  end
  
  def set_direction(first, last)
      return "east" if column(first) < column(last)
      return "west" if column(first) > column(last)
      return "south" if row(first) < row(last)
      return "north" if row(first) > row(last) 
  end 
  
  def previous(letter)
    (letter.ord - 1).chr
  end 

  def row(coordinate)
    coordinate[0]
  end 
  
  def column(coordinate)
    coordinate[1].to_i
  end 
  
  def validate(coordinates_input)
    # todo need to know how Ship will interact with Board
  end 
  
  def print_error(error_code)
    errors = {1 => "You gave coordinates for the wrong ship size.",
    2 => "Your ship cannot wrap around the board.",
    3 => "Your ship cannot overlap with your other ships.",
    4 => "Your ship must be horozontil or vertical."}
    puts "#{errors[error_code]} Please try again: "
  end 

end 