# frozen_string_literal: true

require_relative './board'

# Game class
class Game
  attr_reader :current_player

  def initialize(board)
    @board = board
    @players = %W[X O]
    @current_player = @players.first
  end

  def play
    until game_over?
      display_board
      play_turn
      switch_players
    end
    display_result
  end

  def switch_players
    @current_player = @players.rotate!.first
  end

  def play_turn
    loop do
      column = prompt_column
      if @board.drop_disc(column, @current_player)
        break
      else
        puts "Column #{column} is invalid or full. Try again."
      end
    end
  end

  private

  def game_over?
    @board.winner? || @board.full?
  end

  def display_board
    @board.grid.each do |row|
      puts row.join( '|' )
    end
    puts "\n"
  end

  def prompt_column
    loop do
      print "Player #{@current_player} please enter a column (0-6): "
      input = gets.chomp
      if input =~ /\A[0-6]\z/
        column = input.to_i
        return column
      else
        puts "Invalid column. Please enter a number between 0 and 6."
      end
    end
  end

  def display_result
    display_board
    if @board.winner?
      puts "Player #{@board.winner?} WINS! What a CHAD!"
    else
      puts "It's a TIE!"
    end
  end
end