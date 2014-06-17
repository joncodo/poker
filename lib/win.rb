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


  end

  def is_flush?(cards)
    suits = cards.map(&:suit)
    suits.uniq.count == 1
  end

  def is_straight?(cards)
    #sort all the cards first
    cards = sort_cards(cards)
    numbers = cards.map(&:number)

    #get the lowest card index
    all_numbers = Deck::NUMBERS
    all_numbers_hash = Hash[all_numbers.map.with_index.to_a]
    first_number_index = all_numbers_hash[numbers.first]

    numbers.each_with_index do |number, idx|
      puts number
    end
  end


end