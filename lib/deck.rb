require_relative 'card.rb'

class Deck
  attr_accessor :cards

  SUITS = %w(Clubs Hearts Diamonds Spades)
  NUMBERS = %w(A 2 3 4 5 6 7 8 9 10 J Q K)

  def initialize
    stacked_deck = Deck::SUITS.collect do |suit|
      Deck::NUMBERS.collect do |number|
        Card.new(number, suit)
      end
    end
    @cards = stacked_deck.flatten
  end

  def deal(amount)
    cards = []
    amount.times do
      cards << deal_single_card
    end
    cards
  end

  private

  def deal_single_card
    index = rand(@cards.length)
    card = @cards[index]
    @cards.delete_at(index)
    card
  end
end