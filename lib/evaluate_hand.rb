module EvaluateHand
  def self.is_royal_flush?(cards)
    is_flush, flush_cards, other_cards = is_flush?(cards)
    is_straight = Sorter.is_high_straight?(flush_cards)
    is_flush && is_straight
  end

  def self.is_straight_flush?(cards)
    is_flush, flush_cards, other_cards = is_flush?(cards)
    is_straight = Sorter.is_straight?(flush_cards)
    is_flush && is_straight
  end

  def self.is_four_of_a_kind?(cards)
    matched_desired_pairs?(cards, 4)[:result]
  end

  def self.is_full_house?(cards)
    three_hash = matched_desired_pairs?(cards, 3)
    two_hash = matched_desired_pairs?(cards, 2)
    three_hash[:result] && two_hash[:result] && (three_hash[:card] != two_hash[:card])
  end

  def self.is_flush?(cards)
    return_bool = !flush_suit(cards).nil?

    return_cards = case flush_suit(cards)
                     when 'Hearts'
                       cards.select{|card| card.suit == 'Hearts'}
                     when 'Spades'
                       cards.select{|card| card.suit == 'Spades'}
                     when 'Diamonds'
                       cards.select{|card| card.suit == 'Diamonds'}
                     when 'Clubs'
                       cards.select{|card| card.suit == 'Clubs'}
                     else
                       []
                   end

    other_cards = cards - return_cards
    [return_bool, return_cards, other_cards]
  end

  def self.is_straight?(cards)
    Sorter.is_straight?(cards)
  end

  def self.is_three_of_a_kind?(cards)
    matched_desired_pairs?(cards, 3)[:result]
  end

  def self.is_two_pair?(cards)
    first_pair = matched_desired_pairs?(cards, 2)
    second_pair = matched_desired_pairs?(cards, 2, true)
    different_pairs = first_pair[:card] != second_pair[:card]
    first_pair[:result] && second_pair[:result] && different_pairs
  end

  def self.is_one_pair?(cards)
    matched_desired_pairs?(cards, 2)[:result]
  end

  def self.is_high_card?(cards)
    matched_desired_pairs?(cards, 1)[:result]
  end

  private

  def self.matched_desired_pairs?(cards, desired_pairs, start_at_end=false)
    cards = cards.map(&:number)
    cards.reverse! if start_at_end
    total_card_count = cards.count

    pair_count = 0
    value = 0
    cards.each do |card|
      unless pair_count == desired_pairs
        pair_count = total_card_count - (cards - [card]).count
        value = card
      end
    end
    {result: pair_count == desired_pairs, card: value}
  end

  def self.flush_suit(cards)
    suits = cards.map{|card| card.suit.downcase}
    suits.sort!

    hearts_count = suits.count('hearts')
    clubs_count = suits.count('clubs')
    diamonds_count = suits.count('diamonds')
    spades_count = suits.count('spades')

    if hearts_count >= 5
      'Hearts'
    elsif clubs_count >= 5
      'Clubs'
    elsif diamonds_count >= 5
      'Diamonds'
    elsif spades_count >= 5
      'Spades'
    else
      nil
    end
  end
end