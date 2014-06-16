load 'lib/game.rb'
load 'lib/player.rb'
load 'lib/deck.rb'

puts 'A new round has started!'
game = Game.new
game.deal_round

puts 'Here are the player cards'
puts ''

puts game.show_cards_string('Player1', game.player1.cards)
puts ''
puts game.show_cards_string('Player2', game.player2.cards)

game.deal_middle_cards
puts ''
puts game.show_cards_string('Middle', game.middle_cards)