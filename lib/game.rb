# frozen_string_literal: true

require_relative './board'

# Game class
class Game
  def initialize(board)
    @board = Board.new
    @players = %W[X O]
    @current_player = @players.first
  end

  def play
    
  end

  def switch_players
    @current_player = @players.rotate!.first
  end
end