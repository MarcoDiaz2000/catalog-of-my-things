require 'rspec'
require_relative '../game'

describe Game do
  context 'It should create game' do
    game = Game.new(true, '2000-06-16', '2000-02-27')

    it 'creates a new game with the given parameters' do
      expect(game).to be_an_instance_of Game
    end

    it 'Return correct multiplayer' do
      expect(game.multiplayer).to eq true
    end

    it 'Return correct last_played_at' do
      expect(game.last_played_at.year).to eq 2000
    end
  end
end
