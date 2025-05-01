# frozen_string_literal: true

require 'rspec'
require_relative '../lib/game.rb'

RSpec.describe Game do
  let(:board) { Board.new }
  subject(:game) { described_class.new(board) }

  describe '#switch_players' do
    it 'switches the current player' do
      player_1 = game.instance_variable_get(:@current_player)
      game.switch_players
      expect(game.instance_variable_get(:@current_player))
        .not_to eq(player_1)
      expect(game.instance_variable_get(:@current_player))
        .to eq('O')
    end
  end

  describe '#play' do
    before do
      allow(game).to receive(:display_board)
    end

    context 'when a player wins' do
      it 'announces the winner' do
        allow(game).to receive(:game_over?).and_return true
        allow(board).to receive(:winner?).and_return('X')
        expect {game.play}
          .to output("Player X WINS! What a CHAD!\n")
          .to_stdout
      end
    end

    context 'when the board is full' do
      it 'announces a tie' do
        allow(game).to receive(:display_board)
        allow(board).to receive(:winner?).and_return(nil)
        allow(board).to receive(:full?).and_return true
        expect { game.play }
          .to output("It's a TIE!\n")
          .to_stdout
      end
    end
  end
end