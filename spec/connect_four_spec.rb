require './lib/player'
require './lib/slot'
require './lib/board'
require './lib/game'

RSpec.describe Player do
  describe 'is a player' do
    subject(:player_1) { described_class.new('player_1', 'O') }
    it 'makes a player' do
      expect(player_1).to be_kind_of(Player)
    end

    it 'is named player_1' do
      expect(player_1.name).to eql('player_1')
    end

    it 'has symbol O' do
      expect(player_1.symbol).to eql('O')
    end
  end
end

RSpec.describe Slot do
  describe 'is a slot' do
    subject(:slot) { described_class.new }
    it 'is a slot ' do
      expect(slot).to be_kind_of(Slot)
    end
  end
end

RSpec.describe Board do
  describe 'creates a board full of slots' do
    subject(:board) { described_class.new }
    it 'is a board full of slot objects' do
      board.game_board.each_value do |slot|
        expect(slot).to be_kind_of(Slot)
      end
    end
  end
end
