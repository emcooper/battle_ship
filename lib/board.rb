require 'colorize'
class Board
  attr_reader :length, :grid, :rows, :columns
  
  def initialize(length)
    @length = validate_length(length)
    @grid = blank_grid(@length)
    @rows = @grid.keys[1..@length]
    @columns = @grid["*"]
  end 
  
  def validate_length(length)
    if length.is_a? Fixnum 
      @length = length
    else 
      @length = 4
    end 
  end 
   
   def blank_grid(length)
     new_grid = {}
     new_grid["*"] = Array (1..@length)
     ("A"..(65+@length-1).chr).each do |letter|
       new_grid[letter] = [" "] * @length
     end
     new_grid 
   end 
   
   def record_shot(shot_result, coordinate)
     return nil if !["H", "M"].include?(shot_result)
     row = coordinate[0]
     index = coordinate[1..3].to_i - 1
     return nil if (@grid[row]).nil? || (@grid[row][index]).nil?
     @grid[row][index] = shot_result
   end 
   
   def print_grid
     puts "===".light_blue * @length 
     @grid.each do |key, value|
       padded_values = value.map {|space| space.to_s.center(2)}
       puts "#{key} #{padded_values.join(" ")}"
     end 
     puts "===".light_blue * @length 
   end 
end 
  
