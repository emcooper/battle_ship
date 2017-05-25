require 'pry'
require 'colorize'
require './lib/computer'
require './lib/human'
require './lib/messages'
require './lib/board'

class Game
  attr_reader :messager, :game_size, :human, :computer, :timer
  def initialize
    @messager = Messages.new
    @game_size = 4
    @computer = nil
    @human = Human.new(4)
    @timer = {"start" => nil,"end" => nil}
  end 

  def start 
    start_timer
    puts @messager.welcome
    print_instructions_play_or_quit
  end 

  def set_up_game 
    set_difficulty
    create_players
    place_player_ships
    shot_sequence
  end 
  
  def shot_sequence
    until winner
      human_shot_sequence
      break if winner
      computer_shot_sequence
      enter_for_next
    end 
    end_game if winner
  end 
  
  def end_game
    end_timer
    print_end_game_message
  end
  
  def print_instructions_play_or_quit
    input = @human.get_input
    while input != "p" && input != "q"
      puts @messager.instructions if input == "i" 
      input = @human.get_input
    end 
    set_up_game if input == "p"
  end 
  
  def create_players
    @computer = Computer.new(@game_size)
    @human = Human.new(@game_size)
  end 
  
  def set_difficulty
    puts @messager.game_difficulty_prompt
    @game_size = convert_difficulty_to_number(@human.get_input)
  end 
  
  def place_player_ships
    @computer.place_all_ships
    puts @messager.computer_ship_placement_prompt
    @human.place_all_ships
  end 
  
  def computer_shot_sequence
    enter_for_next
    shot = @computer.get_computer_shot
    record_computer_result(shot)
    print_player_board(@computer)
  end 
  
  def human_shot_sequence
    print_player_board(@human)
    puts @messager.fire_prompt
    shot = @human.get_player_shot
    record_human_result(shot)
    print_player_board(@human)
  end 
  
  def record_human_result(shot)
    result = shot_result(shot, @computer)
    if result[0] == "H"
      record_human_hit(result, shot)
    elsif result[0] == "M"
      record_human_miss(shot)
    end 
  end 
  
  def record_computer_result(shot)
    result = shot_result(shot, @human)
    if result[0] == "H"
      record_computer_hit(result, shot)
    elsif result[0] == "M"
      record_computer_miss(shot)
    end
  end 
  
  def enter_for_next
    puts @messager.proceed
    @human.get_input
  end 
  
  def record_human_hit(result, shot)
    hit_ship = result[1]
    puts @messager.player_hit
    @human.board.record_shot("H", shot)
    puts @messager.player_sink(hit_ship.size) if result[1].sunk == true
  end 

  def record_computer_hit(result, shot)
    hit_ship = result[1]
    puts @messager.computer_shot(shot, "hit")
    @computer.board.record_shot("H", shot)
    puts @messager.computer_sink(hit_ship.size) if result[1].sunk == true
  end 
  
  def record_computer_miss(shot)
    puts @messager.computer_shot(shot, "miss")
    @computer.board.record_shot("M", shot)
  end 
  
  def record_human_miss(shot)
    puts @messager.player_miss
    @human.board.record_shot("M", shot)
  end 
  
  def print_player_board(player)
    puts @messager.human_board_title if player == @human
    puts @messager.computer_board_title if player == @computer
    player.board.print_grid
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
    return 4 
  end 
  
  def format_coordinates(input)
    separated = input.split(" ")
    separated = separated.join if separated.count < 2
    return separated
  end 
  
  def print_end_game_message
    if winner == @human
      puts @messager.end_game_win(@human.shots.count, game_time)
    elsif winner == @computer 
      puts @messager.end_game_lose(@computer.shots.count, game_time)
    end 
  end 
  
  def start_timer
    @timer["start"] = Time.now
  end 
  
  def end_timer
    @timer["end"] = Time.now
  end 
  
  def game_time
    sec = @timer["end"].sec - @timer["start"].sec
    min = @timer["end"].min - @timer["start"].min
    hours = @timer["end"].hour - @timer["start"].hour 
    total_sec = (hours * 60 + min) * 60 + sec
    "#{total_sec/60} minutes and #{total_sec.modulo(60)} seconds"
  end 
end 