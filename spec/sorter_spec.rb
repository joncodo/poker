require 'sorter.rb'
require 'card.rb'

describe Sorter do
  describe '#is_straight?' do
    it 'should not detect a non straight' do
      cards = [Card.new('5'), Card.new('2'), Card.new('7'), Card.new('8'),
               Card.new('10'), Card.new('A'), Card.new('K')]
      expect(Sorter.is_straight?(cards)).to eq false
    end

    it 'should detect a straight' do
      cards = [Card.new('3'), Card.new('2'), Card.new('4'), Card.new('8'),
               Card.new('10'), Card.new('A'), Card.new('5')]
      expect(Sorter.is_straight?(cards)).to eq true
    end

    it 'should detect a straight with ace at the end' do
      cards = [Card.new('J'), Card.new('10'), Card.new('7'), Card.new('8'),
               Card.new('Q'), Card.new('A'), Card.new('K')]
      expect(Sorter.is_straight?(cards)).to eq true
    end
  end

  describe '#convert_cards_to_ints' do
    it 'should return the int equivalent for cards' do
      cards = [Card.new('K')]
      expect(Sorter.convert_cards_to_ints(cards)).to eq [13]

      cards = [Card.new('K'), Card.new('Q'), Card.new('3')]
      expect(Sorter.convert_cards_to_ints(cards)).to eq [13, 12, 3]
    end
  end
end

