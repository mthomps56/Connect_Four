class Slot
  attr_accessor :symbol, :owner, :checks

  def initialize(symbol = '*', owner = nil)
    @symbol = symbol
    @owner = owner
  end

end
