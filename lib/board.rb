require 'pry'
class Board
  attr_reader :length, :grid
  
  def initialize(length)
    @length = length if length.class == Fixnum
    @grid = blank_grid(@length) if @length
  end 
   
   def blank_grid(length)
     new_grid = {}
     new_grid["*"] = Array (1..length)
     ("A"..(65+length-1).chr).each do |letter|
       new_grid[letter] = [" "] * length
     end 
     new_grid
   end 
   
   def record_shot(shot_result, coordinate)
     return nil if !["H", "M"].include?(shot_result)
     row = coordinate[0]
     index = coordinate[1].to_i - 1
     return nil if (@grid[row]).nil? || (@grid[row][index]).nil?
     @grid[row][index] = shot_result
   end 
   
   def print

     
   end 
  
end 
  
