require 'win.rb' unless defined?(Win)

describe Win do
  before(:each) do
    game = Game.new
    game.deal_round
    game.deal_middle_cards
    @win = Win.new(game.player1, game.player2, game.middle_cards)
    @player1_cards = @win.player1.cards + @win.middle_cards
    @royal_flush_hand = [Card.new('A'), Card.new('K'),
                          Card.new('Q'), Card.new('J'),
                          Card.new('10')]

    @straight_flush_hand = [Card.new('2'), Card.new('K'),
                         Card.new('Q'), Card.new('J'),
                         Card.new('10','Spades'), Card.new('9')]
    
    @high_card_hand = [Card.new('A'), Card.new('K'),
                       Card.new('2'), Card.new('3'),
                       Card.new('10','Hearts')]

    @four_of_a_kind_hand = [Card.new('K'), Card.new('K'), Card.new('K'),
                            Card.new('K'), Card.new('3'), Card.new('3'),
                            Card.new('7')]

    @full_house_hand = [Card.new('K'), Card.new('K'), Card.new('K'),
                             Card.new('8'), Card.new('3'), Card.new('3'),
                             Card.new('7')]

    @flush_hand = [Card.new('K'), Card.new('A'), Card.new('K'), Card.new('8'),
                             Card.new('4'), Card.new('3'), Card.new('7')]

    @straight_hand = [Card.new('K'), Card.new('A', 'Clubs'), Card.new('Q', 'Hearts'),
                      Card.new('J', 'Diamond'), Card.new('10'), Card.new('3'),
                      Card.new('7', 'Hearts')]

    @three_of_a_kind_hand = [Card.new('K', 'Clubs'), Card.new('K'), Card.new('K'),
                             Card.new('8', 'Clubs'), Card.new('4'), Card.new('3'),
                             Card.new('7', 'Hearts')]

    @two_pair_hand = [Card.new('K', 'Clubs'), Card.new('K'), Card.new('Q'), Card.new('4'),
                      Card.new('3', 'Hearts'), Card.new('4', 'Diamonds'), Card.new('7')]
    
    @one_pair_hand = [Card.new('K', 'Clubs'), Card.new('K'), Card.new('Q'), Card.new('10'),
                      Card.new('3', 'Hearts'), Card.new('4', 'Diamonds'), Card.new('7')]
  end

  describe '#show_winner_string' do
    it 'should show the winner string' do
      expect(@win.winner_string(@win.player1).nil?).to eq false
    end
  end

  describe '#hand_rank' do
    it 'should return a hand rank, number and the corresponding string' do
      expect(@win.hand_rank(@player1_cards)[:hand_rank]).to be_an(Integer)
      expect(@win.hand_rank(@player1_cards)[:hand_string]).to be_a(String)
    end

    it 'should return the correct index and hands' do
      expect(@win.hand_rank(@royal_flush_hand)).to eq ({hand_rank: 9, hand_string: 'RoyalFlush'})
      expect(@win.hand_rank(@straight_flush_hand)).to eq ({hand_rank: 8, hand_string: 'StraightFlush'})
      expect(@win.hand_rank(@four_of_a_kind_hand)).to eq ({hand_rank: 7, hand_string: 'FourOfKind'})
      expect(@win.hand_rank(@full_house_hand)).to eq ({hand_rank: 6, hand_string: 'FullHouse'})
      expect(@win.hand_rank(@flush_hand)).to eq ({hand_rank: 5, hand_string: 'Flush'})
      expect(@win.hand_rank(@straight_hand)).to eq ({hand_rank: 4, hand_string: 'Straight'})
      expect(@win.hand_rank(@three_of_a_kind_hand)).to eq ({hand_rank: 3, hand_string: 'ThreeOfKind'})
      expect(@win.hand_rank(@two_pair_hand)).to eq ({hand_rank: 2, hand_string: 'TwoPair'})
      expect(@win.hand_rank(@one_pair_hand)).to eq ({hand_rank: 1, hand_string: 'OnePair'})
      expect(@win.hand_rank(@high_card_hand)).to eq ({hand_rank: 0, hand_string: 'HighCard'})
    end
  end

  describe '#is_royal_flush?' do
    it 'should only detect a royal flush' do
      expect(@win.is_royal_flush?(@royal_flush_hand)).to eq true
    end
  end

  describe '#is_four_of_a_kind' do
    it 'should detect 4 of a kind' do
      expect(@win.is_four_of_a_kind?(@four_of_a_kind_hand)).to eq true
    end

    it 'should not detect a full house' do
      expect(@win.is_four_of_a_kind?(@full_house_hand)).to eq false
    end
  end

  describe '#is_full_house' do
    it 'should detect a full house' do
      expect(@win.is_full_house?(@full_house_hand)).to eq true
    end

    it 'should not detect three of a kind' do
      expect(@win.is_full_house?(@three_of_a_kind_hand)).to eq false
    end
  end

  describe '#is_flush?' do
    it 'should return true for a flush of cards' do
      expect(@win.is_flush?(@flush_hand).last).to eq true
      other_flush_hand = [Card.new('2'), Card.new('2', 'Clubs'),
                          Card.new('9', 'Clubs'), Card.new('10', 'Clubs'),
                          Card.new('7', 'Clubs'), Card.new('2', 'Hearts'),
                          Card.new('K', 'Clubs')]
      expect(@win.is_flush?(other_flush_hand).last).to eq true
    end

    it 'should return false for not a flush' do
      expect(@win.is_flush?(@high_card_hand).last).to eq false
    end
  end

  describe '#is_straight?' do
    it 'should return true for a straight of cards' do
      expect(@win.is_straight?(@straight_hand)).to eq true
    end
  end

  describe '#is_three_of_a_kind' do
    it 'should detect 3 of a kind' do
      expect(@win.is_three_of_a_kind?(@three_of_a_kind_hand)).to eq true
    end

    it 'should not detect a non three of a kind' do
      expect(@win.is_three_of_a_kind?(@high_card_hand)).to eq false
    end
  end

  describe '#is_two_pair?' do
    it 'should detect two pair' do
      expect(@win.is_two_pair?(@two_pair_hand)).to eq true
    end

    it 'should not detect one pair' do
      expect(@win.is_two_pair?(@one_pair_hand)).to eq false
    end
  end

  describe '#is_one_pair?' do
    it 'should detect a pair' do
      expect(@win.is_one_pair?(@one_pair_hand)).to eq true
    end

    it 'should not detect a non pair' do
      expect(@win.is_one_pair?(@high_card_hand)).to eq false
    end
  end

  describe '#is_high_card?' do
    it 'should detect a high card hand' do
      expect(@win.is_high_card?(@high_card_hand)).to eq true
    end
  end
end
