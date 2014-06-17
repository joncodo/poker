require 'sorter.rb'
require 'card.rb'

describe Sorter do
  describe '#sort_cards' do
    it 'should sort the cards by number' do
      cards = [Card.new('5'), Card.new('2'), Card.new('7')]
      sorted_cards = [Card.new('2'), Card.new('5'), Card.new('7')]
      expect(Sorter.sort_cards(cards)).to eq sorted_cards
    end

    it 'should sort the cards by number and letters' do
      cards = [Card.new('5'), Card.new('2'), Card.new('J')]
      sorted_cards = [Card.new('2'), Card.new('5'), Card.new('J')]
      expect(Sorter.sort_cards(cards)).to eq sorted_cards
    end

    it 'should sort with ace at the first' do
      cards = [Card.new('3'), Card.new('2'), Card.new('A')]
      sorted_cards = [Card.new('A'), Card.new('2'), Card.new('3')]
      expect(Sorter.sort_cards(cards)).to eq sorted_cards
    end

    it 'should sort with ace at the end' do
      cards = [Card.new('A'), Card.new('K'), Card.new('Q')]
      sorted_cards = [Card.new('Q'), Card.new('K'), Card.new('A')]
      expect(Sorter.sort_cards(cards)).to eq sorted_cards
    end
  end
end

