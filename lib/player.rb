class Player
  attr_accessor :name, :cards
  def initialize(name)
    @name = name
    @cards = []
  end

  def show_cards
    puts @name + "'s cards:"
    @cards.each do |card|
      puts card.display_value
    end
  end
end