class Slot
  attr_accessor :symbol, :player 

  def initialize(symbol = '*', player = nil)
    @symbol = symbol
    @player = player
  end
end
