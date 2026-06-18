require_relative 'slot.rb'
require_relative 'player.rb'

class Board
  attr_accessor :x_axis, :y_axis, :game_board
  def initialize
    @x_axis = (1..7)
    @y_axis = (1..6)
    @game_board = {}
    @checks = { 
               lu: [-1, 1], l: [-1, 0], ld: [-1, -1], 
               d: [ 0, -1], rd: [1, -1],
               r:  [1, 0], ru: [1, 1] 
              } 
    @CONNECT_FOUR = 4
    make_board
  end

  def win_check(position, next_piece, matches = 1)
    return nil if game_board[next_piece].nil?
    winner = true if matches.eql?(CONNECT_FOUR) 
    game_board[position].owner.eql?(next_piece) ? win_check(next_piece, matches += 1)
                                                : (return winner)
  end

  def winner
    puts "YOU WIN or whatever"
  end

  def check_directions(position)
    checks.each_value { |next_piece| win_check(position, next_piece) }
  end

  def make_board
    x_axis.each do |x|
      y_axis.each { |y| game_board[[x, y]] = Slot.new }
    end
  end

  def print_board
    y_axis, x_axis = 6, 7
    y_axis.times do |y|
      y = y_axis - y
      x_axis.times do |x|
        x = x + 1
        print "#{game_board[[x, y]].symbol}  "
#        print "[#{x}, #{y}]  "
        puts if x.eql?(7)
      end
    end
  end

  def take_slot(x_choice, owner)
    y_choice = find_lowest_y(x_choice, owner)
    game_board[[x_choice, y_choice]].symbol = owner.symbol
    game_board[[x_choice, y_choice]].owner =  owner.player_name
  end

  def find_lowest_y(x, owner)
    y_axis.each { |y| game_board[[x, y]].owner.nil? ? (return y) : next }
  end
end

#board = Board.new
#player_1 = Player.new('p1', 'O')
#player_2 = Player.new('p2', 'X')
#x = board.find_lowest_y(1, player_1)
#board.take_slot(x, player_1)
#board.print_board
#x = board.find_lowest_y(2, player_2)
#board.take_slot(x, player_2)
#board.print_board

