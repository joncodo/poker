require 'win.rb'

describe Win do
  before(:each) do
    game = Game.new
    game.deal_round
    game.deal_middle_cards
    @win = Win.new(game.player1, game.player2, game.middle_cards)
    @player1_cards = @win.player1.cards + @win.middle_cards
  end

  describe '#show_winner_string' do
    it 'should show the winner string' do
      expect(@win.winner_string(@win.player1).nil?).to eq false
    end
  end

  describe '#hand_rank' do
    it 'should return a hand rank number and the corresponding string' do
      expect(@win.hand_rank(@player1_cards).first).to be_an(Integer)
      expect(@win.hand_rank(@player1_cards).last).to be_a(String)
    end
  end

  describe '#royal_flush' do
    it 'should only detect a royal flush' do
      cards = [Card.new('A', 'Spades'), Card.new('K', 'Spades'),
               Card.new('Q', 'Spades'), Card.new('J', 'Spades'),
               Card.new('10','Spades')]
      expect(@win.is_royal_flush?(cards)).to eq true
    end
  end
end