class Slot
  attr_accessor :symbol, :owner

  def initialize(symbol = '*', owner = nil)
    @symbol = symbol
    @owner = owner
  end

  def win_check
    checks = { 
               lu: [-1, 1], l: [-1, 0], ld: [-1, -1], 
               d: [ 0, -1], rd: [1, -1],
               r:  [1, 0], ru: [1, 1] 
             } 
  end

end
