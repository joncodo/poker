require_relative 'card.rb'

SUITS = %w('Clubs', 'Hearts', 'Diamonds', 'Spades')
NUMBERS = %w('A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K')

class Deck
  attr_accessor :cards

  def initialize
    stacked_deck = Deck::SUITS.collect do |suit|
      Card::NUMBERS.collect do |number|
        Card.new(number, suit)
      end
    end
    @cards = stacked_deck.flatten
  end

  def deal
    index = rand(@cards.length)
    card = @cards[index]
    @cards.delete_at(index)
    card
  end
end