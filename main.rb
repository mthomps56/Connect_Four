require_relative './lib/board'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/instructions'
include Messages

game = Game.new
board = Board.new
print board.game_board.keys; puts
player_1 = Player.new('O', 'Player 1', PLAYER_1_TURN)
player_2 = Player.new('X', 'Player 2', PLAYER_2_TURN)
players = [player_1, player_2]

# START OF GAME
#
puts INSTRUCTIONS

game_over = false
until game_over do
  players.each do |curr_player|
    board.print_board
    puts ROW_NUMBERS
    x_choice = curr_player.pick_slot
    pos = board.take_slot(x_choice, curr_player)
    game_over = game.run_checks(board.game_board, pos)
    if game_over
      declare_winner(curr_player)
      break
    end
  end
end

