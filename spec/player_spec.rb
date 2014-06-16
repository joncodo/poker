require 'player.rb'

describe Player do
  before(:each) do
    @player = Player.new('Test')
    @player.cards << Card.new('A', 'Spades')
    @player.cards << Card.new('10', 'Spades')
  end
end