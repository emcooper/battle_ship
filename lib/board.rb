require 'pry'
class Board
  attr_reader :length
  
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
  
end 
  
