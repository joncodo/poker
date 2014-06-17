require_relative 'deck.rb'

module Sorter
  def self.sort_cards(cards)
    ints = %w(1 2 3 4 5 6 7 8 9 10 11 12 13 1)
    card_ints = Sorter.convert_cards_to_ints(cards)

    #TODO sort for ace at the end and at the first
    #TODO convert them back to real cards in order
    #TODO the straight test
    #Todo the royal flush test
    #TODO refactor the constants into a constants class

    puts ints.inspect

    # positions = []
    # cards.each do |card|
    #   positions << all_numbers_hash[card.number]
    # end
  end

  def self.convert_cards_to_ints(cards)
    #TODO test this method
    int_array = []
    cards.each do |card|
      if card.number == 'A'
        int_array<<1
      elsif card.number == 'J'
        int_array<<11
      elsif card.number == 'Q'
        int_array<<12
      elsif card.number == 'K'
        int_array<<13
      else
        int_array<<card.number
      end
    end
  end
end