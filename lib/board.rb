require_relative 'slot.rb'
require_relative 'player.rb'

class Board
  attr_accessor :x_axis, :y_axis, :game_board
  def initialize
    @x_axis = (1..7)
    @y_axis = (1..6)
    @game_board = {}
    make_board
  end

  def make_board
    x_axis.each do |x|
      y_axis.each { |y| game_board[[x, y]] = Slot.new }
    end
  end

  def take_slot(x_choice, owner)
    y_choice = find_lowest_y(x_choice, owner)
    puts y_choice
    game_board[[y_choice, x_choice]].symbol = owner.symbol
    game_board[[y_choice, x_choice]].owner =  owner.player_name
  end

  def find_lowest_y(x, owner)
    y_axis.each { |y| game_board[[x, y]].owner.nil? ? (return y) : next }
  end


#  def print_board
#    y_axis.each do |y|
#      x_axis.each do |x| 
#        print "#{game_board[[x, y]].symbol}  "
#        puts if x.eql?(7)
#      end
#    end
#  end

end

board = Board.new
player_1 = Player.new('p1', 'O')
player_2 = Player.new('p2', 'X')
x = board.find_lowest_y(1, player_1)
board.take_slot(x, player_1)
board.print_board
x = board.find_lowest_y(1, player_2)
board.take_slot(x, player_2)
board.print_board



