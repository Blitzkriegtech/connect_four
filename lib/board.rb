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

  def winner?
    vertical_winner? || horizontal_winner? || diagonal_winner?
  end

  private

  def vertical_winner?
    (0...COLS).each do |col|
      (0...ROWS - 3).each do |row|
        current = @grid[row][col]
        next if current == EMPTY

        if current == @grid[row + 1][col] &&
          current == @grid[row + 2][col] &&
          current == @grid[row + 3][col]
          return current
        end
      end
    end
    nil
  end

  def horizontal_winner?
    (0...ROWS).each do |row|
      (0...COLS - 3).each do |col|
        current = @grid[row][col]
        next if current == EMPTY

        if current == @grid[row][col + 1] &&
          current == @grid[row][col + 2] &&
          current == @grid[row][col + 3]
          return current
        end
      end
    end
    nil
  end

  def diagonal_winner?
    # (\) slope
    (0...ROWS - 3).each do |start_row|
      (0...COLS - 3).each do |start_col|
        current = @grid[start_row][start_col]
        next if current == EMPTY

        if current == @grid[start_row + 1][start_col + 1] &&
          current == @grid[start_row + 2][start_col + 2] &&
          current == @grid[start_row + 3][start_col + 3]
          return current
        end
      end
    end
    
    # (/) slope
    (3...ROWS).each do |start_row|
      (0...COLS - 3).each do |start_col|
        current = @grid[start_row][start_col]
        next if current == EMPTY

        if current == @grid[start_row - 1][start_col + 1] &&
          current == @grid[start_row - 2][start_col + 2] &&
          current == @grid[start_row - 3][start_col + 3]
          return current
        end
      end
    end

    nil
  end
end