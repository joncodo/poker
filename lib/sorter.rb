require_relative 'deck.rb'

module Sorter
  def self.is_straight?(cards)
    card_ints = Sorter.convert_cards_to_ints(cards)
    card_ints.sort!

    straight_count = 0
    successful_matches_needed = 4

    card_ints.each_with_index do |card, index|

      if (index+1) < card_ints.count
        next_number = card_ints[index + 1]
      else
        next_number = card_ints.last
      end

      if card + 1 == next_number
        straight_count += 1
      else
        straight_count = 0 unless straight_count == successful_matches_needed
      end
    end

    if straight_count >= successful_matches_needed || self.is_high_straight?(cards)
      return true
    else
      return false
    end
  end

  def self.is_high_straight?(cards)
    card_ints = Sorter.convert_cards_to_ints(cards)
    card_ints.sort!
    match_array = [10, 11, 12, 13, 1]
    (match_array-card_ints).empty?
  end

  def self.convert_cards_to_ints(cards)
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
        int_array<<card.number.to_i
      end
    end
    int_array
  end
end