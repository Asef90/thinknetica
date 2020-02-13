require_relative 'card.rb'
require_relative 'player.rb'

card = Card.new("+", "A")
card2 = Card.new("*", "9")
card3 = Card.new("#", "2")
card4 = Card.new("+", "K")
card5 = Card.new("+", "9")

player = Player.new("Ivan")
player.add_card(card)
player.add_card(card2)
player.add_card(card3)
puts player.points
player.clear_cards
puts player.points

