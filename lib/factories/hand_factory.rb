require_relative '../../lib/card'

class HandFactory
  def self.royal_flush
    [Card.new('A'), Card.new('K'),
     Card.new('Q'), Card.new('J'),
     Card.new('10')]
  end

  def self.straight_flush
    [Card.new('2'), Card.new('K'),
     Card.new('Q'), Card.new('J'),
     Card.new('10','Spades'), Card.new('9')]
  end

  def self.four_of_a_kind
    [Card.new('K'), Card.new('K'), Card.new('K'),
     Card.new('K'), Card.new('3'), Card.new('3'),
     Card.new('7')]
  end

  def self.full_house
    [Card.new('K'), Card.new('K'), Card.new('K'),
     Card.new('8'), Card.new('3'), Card.new('3'),
     Card.new('7')]
  end

  def self.flush
    [Card.new('K'), Card.new('A'), Card.new('K'), Card.new('8'),
     Card.new('4'), Card.new('3'), Card.new('7')]
  end

  def self.straight
    [Card.new('K'), Card.new('A', 'Clubs'), Card.new('Q', 'Hearts'),
     Card.new('J', 'Diamond'), Card.new('10'), Card.new('3'),
     Card.new('7', 'Hearts')]
  end

  def self.three_of_a_kind
    [Card.new('K', 'Clubs'), Card.new('K'), Card.new('K'),
     Card.new('8', 'Clubs'), Card.new('4'), Card.new('3'),
     Card.new('7', 'Hearts')]
  end

  def self.two_pair
    [Card.new('K', 'Clubs'), Card.new('K'), Card.new('Q'), Card.new('4'),
     Card.new('3', 'Hearts'), Card.new('4', 'Diamonds'), Card.new('7')]
  end

  def self.pair
    [Card.new('K', 'Clubs'), Card.new('K'), Card.new('Q'), Card.new('10'),
     Card.new('3', 'Hearts'), Card.new('4', 'Diamonds'), Card.new('7')]
  end

  def self.high_card
    [Card.new('A'), Card.new('K'),
     Card.new('2'), Card.new('3'),
     Card.new('10','Hearts')]
  end
end