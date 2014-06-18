class Win
  attr_accessor :player1, :player2, :middle_cards

  HANDS = %w(HighCard OnePair TwoPair ThreeOfKind Straight Flush FullHouse FourOfKind
              StraightFlush RoyalFlush)

  def initialize(player1, player2, middle_cards)
    @player1 = player1
    @player2 = player2
    @middle_cards = middle_cards
  end

  def winner_string(player)
    player.to_s + ' has won the round!'
  end

  def hand_rank(cards)
    #TODO who has the highest flush?
    #Who has the highest pair
    index = 0
    if is_royal_flush?(cards)
      index = 9
    elsif is_straight_flush?(cards)
      index = 8
    elsif is_four_of_a_kind?(cards)
      index = 7
    elsif is_full_house?(cards)
      index = 6
    elsif is_flush?(cards)
      index = 5
    elsif is_straight?(cards)
      index = 4
    elsif is_three_of_a_kind?(cards)
      index = 3
    elsif is_two_pair?(cards)
      index = 2
    elsif is_one_pair?(cards)
      index = 1
    elsif is_high_card?(cards)
      index = 0
    end

    [index, Win::HANDS[index]]
  end

  def is_royal_flush?(cards)
    Sorter.is_high_straight?(cards) && is_flush?(cards)
  end

  def is_straight_flush?(cards)
    Sorter.is_straight?(cards) && is_flush?(cards)
  end

  def is_four_of_a_kind?(cards)
    matched_desired_pairs?(cards, 4)
  end

  def is_full_house?(cards)
    #TODO
    throw NotImplementedError
  end

  def is_flush?(cards)
    suits = cards.map(&:suit)
    suits.uniq.count == 1
  end

  def is_straight?(cards)
    Sorter.is_straight?(cards)
  end

  def is_three_of_a_kind?(cards)
    matched_desired_pairs?(cards, 3)
  end

  def is_two_pair?(cards)
    #TODO
    throw NotImplementedError
  end

  def is_one_pair?(cards)
    matched_desired_pairs?(cards, 2)
  end

  def is_high_card?(cards)
    matched_desired_pairs?(cards, 1)
  end

  private

  def matched_desired_pairs?(cards, desired_pairs)
    cards = cards.map(&:number)
    total_card_count = cards.count

    pair_count = 0
    cards.each do |card|
      pair_count = total_card_count - (cards - [card]).count unless pair_count == desired_pairs
    end
    pair_count == desired_pairs
  end
end