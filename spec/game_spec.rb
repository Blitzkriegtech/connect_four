# frozen_string_literal: true

require 'rspec'
require_relative '../lib/game.rb'

RSpec.describe Game do
  let(:board) { Board.new }
  subject(:game) { described_class.new(board) }

  describe '#switch_players' do
    it 'switches the current player' do
      player_1 = game.current_player
      game.switch_players
      expect(game.current_player).not_to eq(player_1)
    end
  end
end