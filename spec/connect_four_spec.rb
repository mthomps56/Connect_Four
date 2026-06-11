require './lib/board'
require './lib/player'

describe Board do
  board = Board.new
  p1 = Player.new('p1', 'O')
  it 'makes a board' do
    expect(board.game_board[[2, 2]].symbol).to eql('*')
  end

  it 'puts the player piece in the second column' do
    board.take_slot(1, p1)
    expect(board.game_board[[1, 1]].symbol).to eql('O')
  end

end
