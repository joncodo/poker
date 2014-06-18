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
    #TODO Who has the highest pair
    #TODO TEST these lines and this method is too big
    # cards = @player1.cards + @middle_cards if player == 'Player1'
    # cards = @player2.cards + @middle_cards if player == 'Player2'

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

    {hand_rank: index, hand_string: Win::HANDS[index]}
  end

  def is_royal_flush?(cards)
    Sorter.is_high_straight?(cards) && is_flush?(cards)
  end

  def is_straight_flush?(cards)
    Sorter.is_straight?(cards) && is_flush?(cards)
  end

  def is_four_of_a_kind?(cards)
    matched_desired_pairs?(cards, 4)[:result]
  end

  def is_full_house?(cards)
    three_hash = matched_desired_pairs?(cards, 3)
    two_hash = matched_desired_pairs?(cards, 2)
    three_hash[:result] && two_hash[:result] && (three_hash[:card] != two_hash[:card])
  end

  def is_flush?(cards)
    total_cards_count = cards.count
    suits = cards.map(&:suit)
    #uniq leaves the card there
    #TODO there can be false positives if there are three clubs and two spaides
    suits.uniq.count <= total_cards_count - 4
  end

  def is_straight?(cards)
    Sorter.is_straight?(cards)
  end

  def is_three_of_a_kind?(cards)
    matched_desired_pairs?(cards, 3)[:result]
  end

  def is_two_pair?(cards)
    first_pair = matched_desired_pairs?(cards, 2)
    second_pair = matched_desired_pairs?(cards, 2, true)
    different_pairs = first_pair[:card] != second_pair[:card]
    first_pair[:result] && second_pair[:result] && different_pairs
  end

  def is_one_pair?(cards)
    matched_desired_pairs?(cards, 2)[:result]
  end

  def is_high_card?(cards)
    matched_desired_pairs?(cards, 1)[:result]
  end

  private

  def matched_desired_pairs?(cards, desired_pairs, start_at_end=false)
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
end