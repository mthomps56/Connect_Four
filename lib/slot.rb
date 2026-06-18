class Slot
  attr_accessor :symbol, :owner 

  def initialize(symbol = '*', owner = nil)
    @symbol = symbol
    @owner = owner
  end
end
