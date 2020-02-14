require_relative 'models/card'
require_relative 'models/card_deck'
require_relative 'models/player'
require_relative 'models/game'

def enter_player_name
  puts "Enter player's name:"
  gets.chomp
end

dealer = Player.new('Dealer')
player_name = enter_player_name
player = Player.new(player_name)

# rubocop:disable Metrics/BlockLength
loop do
  game = Game.new(player, dealer)
  begin
    game.take_bets
  rescue RuntimeError
    puts "Player's or dealer's bank = 0"
    break
  end
  game.show_banks
  game.deal_cards_first_time
  game.show_dealer_cards
  game.show_player_cards
  action = game.enter_player_action
  if action == 1
    game.dealer_move
  elsif action == 2
    game.give_card_to(player)
    game.show_player_cards
    game.dealer_move
  end
  game.open_cards
  game.pay_bank
  game.show_banks
  answer = game.play_again?
  if answer == 'y'
    game.clear_cards
    redo
  elsif answer == 'n'
    break
  end
end
# rubocop:enable Metrics/BlockLength
