class Game
  attr_accessor :player1, :player2, :deck, :middle_cards

  def initialize
    @player1 = Player.new('Bill')
    @player2 = Player.new('Laura')
    @deck = Deck.new
    @deck.shuffle
    @middle_cards = []
  end

  def deal_round
    #deal the first card
    @player1.cards << @deck.deal
    @player2.cards << @deck.deal

    #deal the second card
    @player1.cards << @deck.deal
    @player2.cards << @deck.deal
  end

  def deal_middle_cards
    @middle_cards << @deck.deal
    @middle_cards << @deck.deal
    @middle_cards << @deck.deal
    @middle_cards << @deck.deal
    @middle_cards << @deck.deal
  end

  def show_middle_cards
    puts 'The middle cards are:'
    @middle_cards.each do |card|
      puts card.display_value
    end
    nil
  end
end