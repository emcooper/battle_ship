class Ship
  attr_reader :size, :coordinates, :sunk
  def initialize(size)
    @size = size
    @coordinates = {}
    @sunk = false
  end 
  
  def set_coordinates(coordinates_input)
    #validated_input = vaidate(coordinates_input) if vaidate(coordinates_input)
    coordinates_input.each do |input|
      @coordinates[input] = " "
    end 
  end 
  
  def validate(coordinates_input)
    puts "Wrong number of coordinates!" if coordinates_input.length != @size 
  end 

end 