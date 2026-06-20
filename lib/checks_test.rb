def move(curr, dir)
  nxt_pos = [curr[0] + dir[0], curr[1] + dir[1]]
end

def run_checks(pos)
  checks.each_value do |dir|
    connections = 1
    nxt_pos = move(pos, dir)
    
    while game_board[pos]
