require './lib/board'
require './lib/player'

describe Board do
  board = Board.new
  p1 = Player.new('O', 'p1')
  it 'makes a board' do
    expect(board.game_board[[2, 2]].symbol).to eql('*')
  end

  it 'takes the highest y position' do
    x_choice = 2
    board.take_slot(x_choice, p1)
    expect(board.game_board[[1, 1]].symbol).to eql('O')
  end
end
