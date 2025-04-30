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

  def drop_disc(column, disc)
    return false unless (0...COLS).cover?(column)

    row = grid.reverse.index { |r| r[column] == EMPTY }
    return false unless row

    grid[ROWS - 1 - row][column] = disc
    true
  end
end