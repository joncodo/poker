load 'lib/game.rb' unless defined?(Game)
load 'lib/player.rb' unless defined?(Player)
load 'lib/deck.rb' unless defined?(Deck)
load 'lib/win.rb' unless defined?(Win)
load 'lib/sorter.rb' unless defined?(Sorter)

puts '==stats=='

hand = ''
counter = 1
5.times do
  while hand != 'ThreeOfKind'
    game = Game.new
    game.deal_round
    game.deal_middle_cards
    win = Win.new(game.player1, game.player2, game.middle_cards)
    hand = win.hand_rank(game.player1.cards + game.middle_cards)[:hand_string]
    counter += 1
  end
  hand = ''
end

counter /= 10

puts 'You had to be dealt ' + counter.to_s + ' hands to get three of a kind!'


