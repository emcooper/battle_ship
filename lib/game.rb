require "./lib/messages"

class Game
  def initialize
    @messager = Messages.new
  end 
  #start
  def start 
    puts @messager.welcome
    input = get_input
    while input != "p" && input != "q"
      puts @messager.instructions if input == "i" 
      input = get_input
    end 
    play if input == "p"
  end 
  
  def get_input
    print ">"
    gets.chomp
  end 
  
  #play
  def play 
    puts "play"
  end 
  
  #end
  

end 