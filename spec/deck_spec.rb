require 'deck.rb'

describe Deck do
  before(:each) do
    @deck = Deck.new
  end

  describe Deck, '#shuffle' do
    it 'should have a fresh deck of 52 cards' do
      @deck.shuffle
      expect(@deck.cards.count).to eq 52
    end
  end

  describe Deck, '#deal' do
    it 'should deal a single card' do
      @deck.shuffle
      expect(@deck.cards.count).to eq 52
      @deck.deal
      expect(@deck.cards.count).to eq 51
    end
  end
end