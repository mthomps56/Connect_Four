class Player
  attr_accessor :name, :symbol, :turn_message

  def initialize(symbol, name, turn_message)
    @symbol = symbol
    @name = name
    @turn_message = turn_message
  end

  def pick_slot(flag = true)
    choice = nil
    while flag
      announce_turn
      choice = gets.chomp
      choice = choice.to_i
      flag = false if choice >= 1 && choice <= 7
    end
    choice
  end

  def announce_turn
    puts turn_message
  end
end
