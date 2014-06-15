require_relative 'card.rb'

class Deck
  @fresh_deck = []

  def shuffle
    @fresh_deck = [
        Card.new('A', 'Clubs'), Card.new('2', 'Clubs'),Card.new('3', 'Clubs'),Card.new('4', 'Clubs'),Card.new('5', 'Clubs'),Card.new('6', 'Clubs'),Card.new('7', 'Clubs'),Card.new('8', 'Clubs'),Card.new('9', 'Clubs'),Card.new('10', 'Clubs'),Card.new('J', 'Clubs'),Card.new('Q', 'Clubs'),Card.new('K', 'Clubs'),
        Card.new('A', 'Hearts'), Card.new('2', 'Hearts'),Card.new('3', 'Hearts'),Card.new('4', 'Hearts'),Card.new('5', 'Hearts'),Card.new('6', 'Hearts'),Card.new('7', 'Hearts'),Card.new('8', 'Hearts'),Card.new('9', 'Hearts'),Card.new('10', 'Hearts'),Card.new('J', 'Hearts'),Card.new('Q', 'Hearts'),Card.new('K', 'Hearts'),
        Card.new('A', 'Spaids'), Card.new('2', 'Spaids'),Card.new('3', 'Spaids'),Card.new('4', 'Spaids'),Card.new('5', 'Spaids'),Card.new('6', 'Spaids'),Card.new('7', 'Spaids'),Card.new('8', 'Spaids'),Card.new('9', 'Spaids'),Card.new('10', 'Spaids'),Card.new('J', 'Spaids'),Card.new('Q', 'Spaids'),Card.new('K', 'Spaids'),
        Card.new('A', 'Diamonds'), Card.new('2', 'Diamonds'),Card.new('3', 'Diamonds'),Card.new('4', 'Diamonds'),Card.new('5', 'Diamonds'),Card.new('6', 'Diamonds'),Card.new('7', 'Diamonds'),Card.new('8', 'Diamonds'),Card.new('9', 'Diamonds'),Card.new('10', 'Diamonds'),Card.new('J', 'Diamonds'),Card.new('Q', 'Diamonds'),Card.new('K', 'Diamonds')
    ]
  end

  def cards
    @fresh_deck
  end

  def deal
    index = rand(@fresh_deck.length)
    card = @fresh_deck[index]
    @fresh_deck.delete_at(index)
    card
  end
end