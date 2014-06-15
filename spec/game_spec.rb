require 'game.rb'

describe Game do
  before(:each) do
    @game = Game.new
  end

  describe Game, '#' do
    it 'creates two players' do
      expect(@game.player1.nil?).to eq false
      expect(@game.player2.nil?).to eq false
    end

    it 'creates a new deck of cards' do
      expect(@game.deck.nil?).to eq false
    end
  end

  describe Game, '#deal_round' do
    it 'deals two cards to each player' do
      @game.deal_round
      expect(@game.player1.cards.count).to eq 2
      expect(@game.player2.cards.count).to eq 2
    end
  end

  describe Game, '#deal_middle_cards' do
    it 'deals two cards to each player' do
      @game.deal_round
      @game.deal_middle_cards
      expect(@game.middle_cards.count).to eq 5
    end
  end

  describe Game, '#show_middle_cards' do
    it 'prints out the middle cards' do
      @game.deal_round
      @game.deal_middle_cards
      expect(@game.show_middle_cards.nil?).to eq false
    end
  end
end