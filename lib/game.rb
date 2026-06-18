class Game

  attr_reader :checks, :connect_four

  def initialize()
    @checks = { 
               lu: [-1, 1], l: [-1, 0], ld: [-1, -1], 
               d:  [0, -1], rd: [1, -1],
               r:  [1, 0], ru: [1, 1] 
              } 

    @connect_four = 4
  end

  def connect_four?(player)
    player.row_size.eql?(connect_four) ? true : false
  end

  def run_checks(game_board, init_pos, player)
    checks.each_value do |dir|
      p game_board[init_pos]; puts;
      p game_board[dir]
    end
  end
end

