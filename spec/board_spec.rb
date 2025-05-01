# frozen_string_literal: true

require 'rspec'
require_relative '../lib/board'

RSpec.describe Board do
  let(:empty_cell) { Board::EMPTY }
  subject(:board) { Board.new }

  describe '#initialize' do
    it 'creates a 6 by 7 grid with all cells are empty' do
      expect(board.grid.size).to eq(6)
      board.grid.each do |row|
        expect(row.size).to eq(7)
        expect(row).to all(eq(empty_cell))     
      end
    end
  end

  describe '#drop_disc' do
    it 'places a disc in the lowest availbale row of the column' do
      expect(board.drop_disc(0, 'X')).to be true
      expect(board.grid[5][0]).to eq('X')
    end

    it 'stacks discs on top of each other in the same column' do
      board.drop_disc(0, 'X')
      board.drop_disc(0, 'O')
      expect(board.grid[5][0]).to eq('X')
      expect(board.grid[4][0]).to eq('O')
    end

    it 'returns false when column is full' do
      6.times { board.drop_disc(0, 'X') }
      expect(board.drop_disc(0, 'X')).to be false
    end
  end

  describe '#winner?' do
    it 'detects a vertical win' do
      4.times { board.drop_disc(0,'X') }
      expect(board.winner?).to eq('X')
    end

    it 'detects a horizontal win' do
      [0, 1, 2, 3].each { |col| board.drop_disc(0, 'O') }
      expect(board.winner?).to eq('O')
    end

    it 'detects a diagonal win (positive slope)' do
      3.times { board.drop_disc(0, 'O') }
      board.drop_disc(0, 'X')
      2.times { board.drop_disc(1, 'O') }
      board.drop_disc(1, 'X')
      board.drop_disc(2, 'O')
      board.drop_disc(2, 'X')
      board.drop_disc(3, 'X')
      expect(board.winner?).to eq('X')
    end

    it 'detects a diagonal win (negative slope)' do
      board.drop_disc(0, 'X')            # (5,0)

      board.drop_disc(1, 'O')
      board.drop_disc(1, 'X')            # (4,1)
    
      2.times { board.drop_disc(2, 'O') }
      board.drop_disc(2, 'X')            # (3,2)
    
      3.times { board.drop_disc(3, 'O') }
      board.drop_disc(3, 'X')            # (2,3)
    
      expect(board.winner?).to eq('X')
    end

    it 'returns nil when there is no winner' do
      expect(board.winner?).to be_nil
    end
  end

  describe '#full?' do
    it 'return true when all columns are full' do
      7.times do |col|
        6.times { board.drop_disc(col, "X") }
      end
      expect(board.full?).to be true
    end

    it 'returns false when there are empty columns' do
      expect(board.full?).to be false
    end
  end
end