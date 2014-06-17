require 'game.rb'

describe Game do
  before(:each) do
    @game = Game.new
    @game.deal_round
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
      expect(@game.player1.cards.count).to eq 2
      expect(@game.player2.cards.count).to eq 2
    end
  end

  describe Game, '#deal_middle_cards' do
    it 'deals five cards to the middle' do
      @game.deal_middle_cards
      expect(@game.middle_cards.count).to eq 5
    end
  end

  describe Game, '#show_cards' do
    it 'should print out the cards that it is passed' do
      expect(@game.show_cards_string('PlayerTest', @game.player1.cards).nil?).to eq false
    end
  end
end