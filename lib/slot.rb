class Slot
  attr_accessor :symbol, :owner, :checks

  def initialize(symbol = '*', owner = nil)
    @symbol = symbol
    @owner = owner
    @checks = { 
                lu: [-1, 1], l: [-1, 0], ld: [-1, -1], 
                d: [ 0, -1], rd: [1, -1],
                r:  [1, 0], ru: [1, 1] 
              } 
    @CONNECT_FOUR = 4
  end

  def win_check(slot)
    matches = 1
    checks.each_value do |pos|
  end

end
