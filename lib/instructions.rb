# frozen_string_literal: true

# A Module with game start instructions, turn messages, and the
# winner's message upon a connect 4.
module Messages
  INSTRUCTIONS = <<~HEREDOC


    **____CONNECT 4____**

        Player 1 is O
        Player 2 is X

    Hit four slots in a row veritically,#{' '}
    horizontally, or diagonally to win.

    Type the column number then enter to
    take your turn.


  HEREDOC

  PLAYER_1_TURN = "Player_1's turn: > "
  PLAYER_2_TURN = "Player_2's turn: > "

  ROW_NUMBERS = '1  2  3  4  5  6  7'

  def declare_winner(player)
    puts "#{player.name} WINS! Connect 4!!!!"
  end
end
