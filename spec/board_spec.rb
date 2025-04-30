# frozen_string_literal: true

require 'rspec'
require_relative ''

describe Board do
  let(:empty_cell) { Board::EMPTY }
  let(:board) { Board.new }

  describe '#initialize' do
    it 'creates a 6 by 7 grid with all cells are empty' do
      expect(board.grid.size).to eq(6)
      board.grid.each do |row|
        expect(row.size).to eq(7)
        expect(row).to all(eq(empty_cell))
        
      end
    end
  end
end