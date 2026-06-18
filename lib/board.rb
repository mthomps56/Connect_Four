require_relative 'slot.rb'
require_relative 'player.rb'

class Board
  attr_accessor :x_axis, :y_axis, :game_board, :checks
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
    game_board[[x_choice, y_choice]].owner =  owner.name
    return game_board[[x_choice, y_choice]].owner
  end

  def find_lowest_y(x, owner)
    y_axis.each { |y| game_board[[x, y]].owner.nil? ? (return y) : next }
  end
end

board = Board.new
board.print_board
