class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def pick_slot
    choice = gets.chomp
  end
end
