class Game
  attr_accessor :player1, :player2, :deck, :middle_cards

  def initialize
    @player1 = Player.new('Bill')
    @player2 = Player.new('Laura')
    @deck = Deck.new
    @middle_cards = []
  end

  def deal_round
    @player1.cards = @deck.deal(2)
    @player2.cards = @deck.deal(2)
  end

  def deal_middle_cards
    @middle_cards = @deck.deal(5)
  end

  def show_cards_string(object_name, cards)
    return_string = ''
    return_string << object_name + " cards are: \n"
    cards.each do |card|
      return_string << card.display_value + "\n"
    end
    return_string
  end
end