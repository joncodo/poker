load 'lib/game.rb' unless defined?(Game)
load 'lib/player.rb' unless defined?(Player)
load 'lib/deck.rb' unless defined?(Deck)
load 'lib/win.rb' unless defined?(Win)
load 'lib/sorter.rb' unless defined?(Sorter)

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

win = Win.new(game.player1, game.player2, game.middle_cards)

puts ''
puts 'Player1 has: ' + win.hand_rank(game.player1.cards + game.middle_cards)[:hand_string]
puts 'Player2 has: ' + win.hand_rank(game.player2.cards + game.middle_cards)[:hand_string]


