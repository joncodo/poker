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
    index = 0
    if is_royal_flush?(cards)
      index = 9
    end
    #TODO add all the hand checks

    [index, Win::HANDS[index]]
  end

  def is_royal_flush?(cards)
    Sorter.is_high_straight?(cards) && is_flush?(cards)
  end

  def is_flush?(cards)
    suits = cards.map(&:suit)
    suits.uniq.count == 1
  end

  def is_straight?(cards)
    Sorter.is_straight?(cards)
  end
end