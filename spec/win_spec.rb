require 'win.rb' unless defined?(Win)
require_relative '../lib/factories/hand_factory' unless defined?(HandFactory)

describe Win do
  before(:each) do
    game = Game.new
    game.deal_round
    game.deal_middle_cards
    @win = Win.new(game.player1, game.player2, game.middle_cards)
    @player1_cards = @win.player1.cards + @win.middle_cards
  end

  describe '#winner_string' do
    it 'should show the winner string' do
      expect(@win.winner_string.nil?).to eq false
    end

    #TODO test everything else
  end

  describe '#hand_rank' do
    it 'should return a hand rank, number and the corresponding string' do
      expect(@win.hand_rank(@player1_cards)[:hand_rank]).to be_an(Integer)
      expect(@win.hand_rank(@player1_cards)[:hand_string]).to be_a(String)
    end

    it 'should return the correct index and hands' do
      expect(@win.hand_rank(HandFactory.royal_flush)[:hand_rank]).to eq 9
      expect(@win.hand_rank(HandFactory.royal_flush)[:hand_string]).to eq 'RoyalFlush'

      expect(@win.hand_rank(HandFactory.straight_flush)[:hand_rank]).to eq 8
      expect(@win.hand_rank(HandFactory.straight_flush)[:hand_string]).to eq 'StraightFlush'

      expect(@win.hand_rank(HandFactory.four_of_a_kind)[:hand_rank]).to eq 7
      expect(@win.hand_rank(HandFactory.four_of_a_kind)[:hand_string]).to eq 'FourOfKind'

      expect(@win.hand_rank(HandFactory.full_house)[:hand_rank]).to eq 6
      expect(@win.hand_rank(HandFactory.full_house)[:hand_string]).to eq 'FullHouse'

      expect(@win.hand_rank(HandFactory.flush)[:hand_rank]).to eq 5
      expect(@win.hand_rank(HandFactory.flush)[:hand_string]).to eq 'Flush'

      expect(@win.hand_rank(HandFactory.straight)[:hand_rank]).to eq 4
      expect(@win.hand_rank(HandFactory.straight)[:hand_string]).to eq 'Straight'

      expect(@win.hand_rank(HandFactory.three_of_a_kind)[:hand_rank]).to eq 3
      expect(@win.hand_rank(HandFactory.three_of_a_kind)[:hand_string]).to eq 'ThreeOfKind'

      expect(@win.hand_rank(HandFactory.two_pair)[:hand_rank]).to eq 2
      expect(@win.hand_rank(HandFactory.two_pair)[:hand_string]).to eq 'TwoPair'

      expect(@win.hand_rank(HandFactory.pair)[:hand_rank]).to eq 1
      expect(@win.hand_rank(HandFactory.pair)[:hand_string]).to eq 'OnePair'

      expect(@win.hand_rank(HandFactory.high_card)[:hand_rank]).to eq 0
      expect(@win.hand_rank(HandFactory.high_card)[:hand_string]).to eq 'HighCard'
    end
  end
end
