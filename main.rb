require_relative './lib/board'
require_relative './lib/slot'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/instructions'
include Messages

board = Board.new
player_1 = Player.new('Player 1', 'O')
player_2 = Player.new('Player 2', 'X')

puts INSTRUCTIONS
board.print_board
puts ROW_NUMBERS


#puts PLAYER_1_TURN


