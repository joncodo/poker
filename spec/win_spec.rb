require 'win.rb'

describe Win do
  before(:each) do
    game = Game.new
    game.deal_round
    game.deal_middle_cards
    @win = Win.new(game.player1, game.player2, game.middle_cards)
    @player1_cards = @win.player1.cards + @win.middle_cards
    @royal_flush_hand = [Card.new('A', 'Spades'), Card.new('K', 'Spades'),
                          Card.new('Q', 'Spades'), Card.new('J', 'Spades'),
                          Card.new('10','Spades')]
    @high_card_hand = [Card.new('A', 'Spades'), Card.new('K', 'Spades'),
                       Card.new('2', 'Spades'), Card.new('3', 'Spades'),
                       Card.new('10','Hearts')]
  end

  describe '#show_winner_string' do
    it 'should show the winner string' do
      expect(@win.winner_string(@win.player1).nil?).to eq false
    end
  end

  describe '#hand_rank' do
    it 'should return a hand rank, number and the corresponding string' do
      expect(@win.hand_rank(@player1_cards).first).to be_an(Integer)
      expect(@win.hand_rank(@player1_cards).last).to be_a(String)
    end
  end

  describe '#is_royal_flush?' do
    it 'should only detect a royal flush' do
      expect(@win.is_royal_flush?(@royal_flush_hand)).to eq true
    end
  end

  describe '#is_flush?' do
    it 'should return true for a flush of cards' do
      expect(@win.is_flush?(@royal_flush_hand)).to eq true
    end

    it 'should return false for not a flush' do
      expect(@win.is_flush?(@high_card_hand)).to eq false
    end
  end

  describe '#is_straight?' do
    it 'should return true for a straight of cards' do
      expect(@win.is_straight?(@royal_flush_hand)).to eq true
    end
  end

  describe '#is_four_of_a_kind' do
    it 'should detect 4 of a kind' do
      cards = [Card.new('K'), Card.new('K'), Card.new('K'), Card.new('K'),
               Card.new('3'), Card.new('3'), Card.new('7')]
      expect(@win.is_four_of_a_kind?(cards)).to eq true
    end

    it 'should not detect a full house' do
      cards = [Card.new('K'), Card.new('K'), Card.new('K'), Card.new('8'),
               Card.new('3'), Card.new('3'), Card.new('7')]
      expect(@win.is_four_of_a_kind?(cards)).to eq false
    end
  end

  describe '#is_three_of_a_kind' do
    it 'should detect 3 of a kind' do
      cards = [Card.new('K'), Card.new('K'), Card.new('Q'), Card.new('K'),
               Card.new('3'), Card.new('3'), Card.new('7')]
      expect(@win.is_three_of_a_kind?(cards)).to eq true
    end

    it 'should not detect a non three of a kind' do
      cards = [Card.new('K'), Card.new('K'), Card.new('Q'), Card.new('Q'),
               Card.new('3'), Card.new('3'), Card.new('7')]
      expect(@win.is_three_of_a_kind?(cards)).to eq false
    end
  end

  describe '#is_one_pair?' do
    it 'should detect a pair' do
      cards = [Card.new('K'), Card.new('K'), Card.new('Q'), Card.new('4'),
               Card.new('3'), Card.new('5'), Card.new('7')]
      expect(@win.is_one_pair?(cards)).to eq true
    end

    it 'should not detect a non pair' do
      cards = [Card.new('K'), Card.new('J'), Card.new('Q'), Card.new('10'),
               Card.new('3'), Card.new('4'), Card.new('7')]
      expect(@win.is_one_pair?(cards)).to eq false
    end
  end

  describe '#is_high_card?' do
    it 'should detect a high card hand' do
      cards = [Card.new('K'), Card.new('2'), Card.new('Q'), Card.new('4'),
               Card.new('3'), Card.new('5'), Card.new('7')]
      expect(@win.is_high_card?(cards)).to eq true
    end
  end
end
