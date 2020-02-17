require_relative 'models/card'
require_relative 'models/card_deck'
require_relative 'models/player'
require_relative 'models/game'
require_relative 'interface_methods'

dealer = Player.new('Dealer')
player_name = enter_player_name
player = Player.new(player_name)

loop do
  game = Game.new(player, dealer)
  show_bet(game)
  game.take_bets
  show_banks(game)
  game.deal_cards_first_time
  show_dealer_cards_before
  show_player_cards(game)
  show_player_points(game)
  game.player_action(enter_player_action)
  show_cards(game)
  show_points(game)
  show_result(game)
  game.pay_bank
  show_banks(game)
  answer = play_again?
  game.restart_game(answer)
  break if answer == :n || game.game_over?
end
