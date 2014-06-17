class Card
  attr_accessor :suit, :number, :display_value

  def initialize(number='Spades', suit)
    @number = number
    @suit = suit
    @display_value = number.to_s + '-' + suit.to_s
  end
end