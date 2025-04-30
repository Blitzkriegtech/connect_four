# frozen_string_literal: true

require 'rspec'
require_relative '../lib/board'

describe Board do
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
      6.times { broad.drop_disc(0, 'X') }
      expect(board.drop_disc(0, 'X')).to be false
    end
  end
end