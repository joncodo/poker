class Player
  attr_accessor :name, :cards
  def initialize(name)
    @name = name
    @cards = []
  end
end