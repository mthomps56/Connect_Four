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

  def connect_four?(consecutive_pieces)
    x = consecutive_pieces.eql?(connect_four) ? true : false
    puts "inside connect_4? method: #{x}"
    return x
  end

  def valid_move?(pos)
    valid_first  = pos.first >= 1 && pos.first <= 7 ? true : false
    valid_last   = pos.last  >= 1 && pos.last <= 6 ? true : false
    valid_first && valid_last ? (return true) : (return false)
  end

  def move(curr, dir)
    if valid_move?(curr)
      nxt_pos = [curr[0] + dir[0], curr[1] + dir[1]]
      valid_move?(nxt_pos) ? (return nxt_pos) : (return nil)
    end
  end

  def _run_checks(game_board, pos, player, win = false)
    checks.each_value do |dir| 
      connections = 1
      nxt_pos = move(pos, dir)
      puts "before while: #{nxt_pos}" 
      next unless valid_move?(nxt_pos)
      puts "after next"
      while game_board[pos].player == game_board[nxt_pos].player
        connections += 1
        nxt_pos = move(nxt_pos, dir)
        puts "in while, after move: #{nxt_pos}"
        if connections.eql?(connect_four)
          puts "you are winner"
          break
        end
      end
    end
  end

  def run_checks(game_board, pos, win = false)
    checks.each_value do |dir|
      connections = 1
      nxt_pos = pos
      loop do
        nxt_pos = move(nxt_pos, dir)
        break if nxt_pos.nil? 
        break unless game_board[pos].player == game_board[nxt_pos].player
        connections +=1
        puts "connections #{connections}"
      end
      win = connect_four?(connections) 
      break if win
    end
    return win
  end
end

