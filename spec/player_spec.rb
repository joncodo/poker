require 'player.rb'

describe Player do
  before(:each) do
    @player = Player.new('Test')
    @player.cards << Card.new('A', 'Spades')
    @player.cards << Card.new('10', 'Spades')
  end

  describe Player, '#show_cards' do
    it 'should have two cards once a game is started' do
      expect(@player.show_cards.nil?).to eq false
    end
  end
end