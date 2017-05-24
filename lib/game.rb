require 'pry'
require './lib/computer'
require './lib/human'
require './lib/messages'
require './lib/board'

class Game
  attr_reader :game_size, :human, :computer
  def initialize
    @messager = Messages.new
    @game_size = 4
    @computer = nil
    @human = Human.new(4)
  end 
  
  #start
  def start 
    puts @messager.welcome
    input = @human.get_input
    while input != "p" && input != "q"
      puts @messager.instructions if input == "i" 
      input = get_input
    end 
    play if input == "p"
  end 
  
  #play
  def play 
    puts @messager.game_difficulty_prompt
    @game_size = convert_difficulty_to_number(@human.get_input)
    @computer = Computer.new(@game_size)
    @human = Human.new(@game_size)
    @computer.place_all_ships
    puts @messager.computer_ship_placement_prompt
    @human.place_all_ships
    shot_sequence
    #shot sequence 
  end 
    
  def shot_sequence
    #repeat until at ships sunk:
    while winner.nil?
    #human shot
      puts @messager.fire_prompt
      shot = @human.get_player_shot
      result = shot_result(shot, @computer)
      h_or_m = result[0]
      if h_or_m == "H"
        hit_ship = result[1]
        puts @messager.player_hit
        @human.board.record_shot("H", shot)
        if result[1].sunk == true
          puts @messager.player_sink(hit_ship.size)
        end 
      elsif h_or_m == "M"
        puts @messager.player_miss
        @human.board.record_shot("M", shot)
      end 
      @human.board.print_grid
      break if winner
      puts "press enter to proceed"
      @human.get_input
      
      #computer shot
      shot = @computer.get_computer_shot
      result = shot_result(shot, @human)
      h_or_m = result[0]
      if h_or_m == "H"
        hit_ship = result[1]
        puts @messager.computer_shot(shot, "Hit")
        @computer.board.record_shot("H", shot)
        if result[1].sunk == true
          puts @messager.computer_sink(hit_ship.size)
        end 
      elsif h_or_m == "M"
        puts @messager.computer_shot(shot, "Miss")
        @computer.board.record_shot("M", shot)
      end
      @computer.board.print_grid
    end 
    end_game
  end 
  
  def end_game
    if winner == @human
      puts @messager.end_game_win(@human.shots.count, "5 hrs")
    elsif winner == @computer 
      puts @messager.end_game_lose(@computer.shots.count, "6 hrs")
    end   
  end 
  
  def winner
    winner = nil
    winner = @human if @computer.fleet.count { |ship| ship.sunk == true}  == @computer.fleet.count
    winner = @computer if @human.fleet.count { |ship| ship.sunk == true}  == @human.fleet.count  
    return winner
  end 
  
  # def get_player_shot
  #   @human.shots << format_coordinates(@human.get_input)
  #   return @human.shots.last
  # end 
  
  # def get_computer_shot
  #   @computer.shots << @computer.random_coordinate
  #   return @computer.shots.last
  # end 
  
  def shot_result(shot_coordinate, opponent)
    result = ["M", nil]
    opponent.fleet.each do |ship|
      if ship.coordinates.keys.include?(shot_coordinate)
        ship.hit(shot_coordinate)
        result = ["H", ship] 
      end 
    end 
    result 
  end 

  # def place_all_human_ships
  #   @human.fleet.each do |ship|
  #     puts @messager.human_ship_placement_prompt(ship.size)
  #     coordinates = format_coordinates(@human.get_input)
  #     ship.set_coordinates(coordinates[0], coordinates[1])
  #   end 
  # end 
  
  def convert_difficulty_to_number(difficulty)
    return 4 if difficulty.downcase == "b"
    return 8 if difficulty.downcase == "i"
    return 12 if difficulty.downcase == "a"
  end 
  
  def format_coordinates(input)
    separated = input.split(" ")
    separated = separated.join if separated.count < 2
    return separated
  end 
  #end
  

end 