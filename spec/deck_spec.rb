require 'deck.rb'

describe Deck do
  before(:each) do
    @deck = Deck.new
  end

  describe Deck, '#' do
    it 'should have a fresh deck of 52 cards' do
      expect(@deck.cards.count).to eq 52
    end
  end

  describe Deck, '#deal' do
    it 'should deal a single card' do
      @deck.deal(1)
      expect(@deck.cards.count).to eq 51
    end

    it 'should deal multiple cards' do
      @deck.deal(5)
      expect(@deck.cards.count).to eq 47
    end
  end
end