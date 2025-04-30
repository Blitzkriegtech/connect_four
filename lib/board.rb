# frozen_string_literal: true

# board class
class Board
  EMPTY = '.'
  ROWS = 6
  COLS = 7

  attr_reader :grid

  def initialize
    @grid = Array.new(ROWS) { Array.new(COLS, EMPTY) }
  end
end