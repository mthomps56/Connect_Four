# frozen_string_literal: true

# The Slot class is used as each empty hole in the connect 4 board.
# When a player takes a turn, the slot their piece drops to becomes theres.
class Slot
  attr_accessor :symbol, :player

  def initialize(symbol = '*', player = nil)
    @symbol = symbol
    @player = player
  end
end
