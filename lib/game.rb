require 'pry'
require 'colorize'
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
    @timer = {"start" => nil,"end" => nil}
  end 

  def start 
    @timer["start"] = Time.now
    puts @messager.welcome
    input = @human.get_input
    while input != "p" && input != "q"
      puts @messager.instructions if input == "i" 
      input = @human.get_input
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
      puts @messager.player_board_title
      @human.board.print_grid
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
      puts @messager.player_board_title
      @human.board.print_grid
      break if winner
      puts @messager.proceed
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
      puts @messager.proceed
      @human.get_input
    end 
    end_game if winner
  end 
  
  def end_game
    @timer["end"] = Time.now
    if winner == @human
      puts @messager.end_game_win(@human.shots.count, game_time)
    elsif winner == @computer 
      puts @messager.end_game_lose(@computer.shots.count, game_time)
    end 
  end
  
  def winner
    winner = nil
    winner = @human if @computer.fleet.count { |ship| ship.sunk == true}  == @computer.fleet.count
    winner = @computer if @human.fleet.count { |ship| ship.sunk == true}  == @human.fleet.count  
    return winner
  end 

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

  def convert_difficulty_to_number(difficulty)
    return 8 if difficulty.downcase == "i"
    return 12 if difficulty.downcase == "a"
    else return 4 
  end 
  
  def format_coordinates(input)
    separated = input.split(" ")
    separated = separated.join if separated.count < 2
    return separated
  end 
  
  def game_time
    sec = @timer["end"].sec - @timer["start"].sec
    min = @timer["end"].min - @timer["start"].min
    hours = @timer["end"].hour - @timer["start"].hour 
    "#{hours * 60 + min} minutes and #{sec} seconds"
  end 
end 