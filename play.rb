load 'lib/game.rb'
load 'lib/player.rb'
load 'lib/deck.rb'

puts 'A new round has started!'
game = Game.new
game.deal_round

puts 'Here are the player cards'
puts ''
game.player1.show_cards
puts ''
game.player2.show_cards

game.deal_middle_cards
puts ''
puts game.show_middle_cards