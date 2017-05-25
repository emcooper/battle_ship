
class Ship
  attr_reader :size, :coordinates, :direction, :sunk
  def initialize(size)
    @size = size
    @coordinates = {}
    @direction = nil
    @sunk = false
  end 
  
  def set_coordinates(first, last)
    @direction = set_direction(first, last)
    row = row(first)
    column = column(first)
    if @direction == "east"
      until column > column(last)
        add_coordinate(row, column)
        column += 1
      end 
    elsif @direction == "west"
      until column < column(last)
        add_coordinate(row, column)
        column -= 1
      end 
    elsif @direction == "south"
      until row > row(last)
        add_coordinate(row, column)
        row = row.next
      end 
    elsif @direction == "north"
      until row < row(last)
        add_coordinate(row, column)
        row = previous(row)
      end   
    end 
  end
  
  def add_coordinate(row, column)
    @coordinates[row + column.to_s] = " "
  end 
  
  def set_direction(first, last)
      return "east" if column(first) < column(last)
      return "west" if column(first) > column(last)
      return "south" if row(first) < row(last)
      return "north" if row(first) > row(last) 
  end 
  
  def hit(coordinate)
    @coordinates[coordinate] = "H"
    check_if_sunk
  end 
  
  def check_if_sunk
    @sunk = true if @coordinates.values.uniq == ["H"]
  end 
  
  def previous(letter)
    (letter.ord - 1).chr
  end 

  def row(coordinate)
    coordinate[0]
  end 
  
  def column(coordinate)
    coordinate[1..3].to_i
  end 
end 