# frozen_string_literal: true

require_relative 'slot'
require_relative 'player'

# The Board class holds the slots that a player's piece drops in to
# when the player takes their turn.
class Board
  attr_accessor :x_axis, :y_axis, :game_board, :checks

  def initialize
    @x_axis = (1..7)
    @y_axis = (1..6)
    @game_board = {}
    make_board
  end

  # Creates the Connect Four board upon instantiation of the board class.
  def make_board
    x_axis.each do |x|
      y_axis.each { |y| game_board[[x, y]] = Slot.new }
    end
  end

  # Prints the board with the most recent update to each slot's owner
  def print_board
    y_axis = 6
    x_axis = 7
    y_axis.times do |y|
      y = y_axis - y
      x_axis.times do |x|
        x += 1
        print "#{game_board[[x, y]].symbol}  "
        puts if x.eql?(7)
      end
    end
  end

  # A player, upon their turn takes the next available slot in column, setting
  # the symbol and player attributes of the chosen slot to that players.
  def take_slot(x_choice, player)
    y_choice = find_lowest_y(x_choice)
    game_board[[x_choice, y_choice]].symbol = player.symbol
    game_board[[x_choice, y_choice]].player = player.name
    [x_choice, y_choice]
  end

  # Finds the lowest possible slot (it's 'y' position) in the chosen column
  # (it's 'x' position)
  def find_lowest_y(x)
    y_axis.each { |y| game_board[[x, y]].player.nil? ? (return y) : next }
  end
end
