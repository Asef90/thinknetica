require_relative 'card'
require_relative 'player'
require_relative 'card_deck'

cd = CardDeck.new
player = Player.new("Ivan")
player.add_card(cd.draw_card)
player.add_card(cd.draw_card)
player.add_card(cd.draw_card)

puts player.bank
player.increase_bank(50)
puts player.bank
player.show_cards

