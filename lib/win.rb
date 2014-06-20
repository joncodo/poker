require_relative '../lib/evaluate_hand.rb' unless defined?(EvaluateHand)

class Win
  attr_accessor :player1, :player2, :middle_cards

  HANDS = %w(HighCard OnePair TwoPair ThreeOfKind Straight Flush FullHouse FourOfKind
              StraightFlush RoyalFlush)

  def initialize(player1, player2, middle_cards)
    @player1 = player1
    @player2 = player2
    @middle_cards = middle_cards
  end

  def winner_string
    p1_hash = hand_rank(@player1.cards)
    p2_hash = hand_rank(@player2.cards)

    p1_hand_rank = p1_hash[:hand_rank]
    p1_hand_string = p1_hash[:hand_string]
    p1_set_cards = p1_hash[:set_cards]
    p1_other_cards = p1_hash[:other_cards]

    p2_hand_rank = p2_hash[:hand_rank]
    p2_hand_string = p2_hash[:hand_string]
    p2_set_cards = p2_hash[:set_cards]
    p2_other_cards = p2_hash[:other_cards]

    p1_set_rank = hand_set_rank(p1_set_cards)
    p2_set_rank = hand_set_rank(p2_set_cards)

    p1_other_rank = other_rank(p1_other_cards)
    p2_other_rank = other_rank(p2_other_cards)

    hand_rank_winner = nil
    if p1_hand_rank > p2_hand_rank
      hand_rank_winner = 'Player1'
    elsif p1_hand_rank < p2_hand_rank
      hand_rank_winner = 'Player2'
    end

    set_rank_winner = nil
    if p1_set_rank > p2_set_rank
      set_rank_winner = 'Player1'
    elsif p1_set_rank < p2_set_rank
      set_rank_winner = 'Player2'
    end

    other_rank_winner = nil
    if p1_other_rank > p2_other_rank
      other_rank_winner = 'Player1'
    elsif p1_other_rank < p2_other_rank
      other_rank_winner = 'Player2'
    end

    winner = hand_rank_winner || set_rank_winner || other_rank_winner
    if winner == 'Player1'
      hand_string = p1_hand_string
    else
      hand_string = p2_hand_string
    end

    #TODO hand_card
    #TODO high_card
    hand_card = '5'
    high_card = '5'

    winner + ' has won the round with ' + hand_string +
      ' ' + hand_card + ' ' + high_card + ' high!'
  end

  def hand_set_rank(cards)
    rand(10)
    #returns the rank int
  end

  def other_rank(cards)
    rand(10)
    #returns the rank int
  end

  def hand_rank(cards)
    index = 0
    if EvaluateHand.is_royal_flush?(cards)
      index = 9
    elsif EvaluateHand.is_straight_flush?(cards)
      index = 8
    elsif EvaluateHand.is_four_of_a_kind?(cards)
      index = 7
    elsif EvaluateHand.is_full_house?(cards)
      index = 6
    elsif EvaluateHand.is_flush?(cards).first
      index = 5
    elsif EvaluateHand.is_straight?(cards)
      index = 4
    elsif EvaluateHand.is_three_of_a_kind?(cards)
      index = 3
    elsif EvaluateHand.is_two_pair?(cards)
      index = 2
    elsif EvaluateHand.is_one_pair?(cards)
      index = 1
    elsif EvaluateHand.is_high_card?(cards)
      index = 0
    end

    {hand_rank: index, hand_string: Win::HANDS[index], set_cards: true, other_cards: true}
  end
end