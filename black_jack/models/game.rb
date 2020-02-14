class Game
  BET = 10
  NUM_OF_PLAYERS = 2
  LIMIT_POINTS = 21

  attr_reader :player, :dealer, :card_deck, :game_bank

  def initialize(player, dealer)
    @dealer = dealer
    @player = player
    @card_deck = CardDeck.new
  end

  def take_bets
    puts "Taking bets: #{BET}"
    dealer.reduce_bank(BET)
    player.reduce_bank(BET)
    self.game_bank = NUM_OF_PLAYERS * BET
  end

  def give_card_to(player)
    player.add_card(card_deck.draw_card)
  end

  def deal_cards_first_time
    puts 'Dealing cards first time.'
    2.times { give_card_to(player) }
    2.times { give_card_to(dealer) }
  end

  def show_dealer_cards
    puts "Dealer's cards : ** **"
  end

  def show_player_cards
    player.show_cards
  end

  def play_again?
    puts 'Play again? y/n'
    gets.chomp.downcase
  end

  def enter_player_action
    puts 'What to do:'
    puts '1. Skip'
    puts '2. Add card'
    puts '3. Open cards'
    gets.chomp.to_i
  end

  def dealer_move
    give_card_to(dealer) if dealer.points < 17
  end

  def open_cards
    puts 'Opening cards.'
    dealer.show_cards
    player.show_cards
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def pay_bank
    player_points = player.points
    dealer_points = dealer.points
    if (player_points <= LIMIT_POINTS && player_points > dealer_points) ||
       (player_points <= LIMIT_POINTS && dealer_points > LIMIT_POINTS)
      puts "#{player.name} win."
      player.increase_bank(game_bank)
    elsif (dealer_points <= LIMIT_POINTS && dealer_points > player_points) ||
          (dealer_points <= LIMIT_POINTS && player_points > LIMIT_POINTS)
      puts 'Dealer win.'
      dealer.increase_bank(game_bank)
    else
      puts "It's draw."
      return_bank
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def return_bank
    player.increase_bank(BET)
    dealer.increase_bank(BET)
  end

  def show_banks
    puts "#{player.name}'s bank: #{player.bank}."
    puts "Dealer's bank : #{dealer.bank}."
  end

  def clear_cards
    player.clear_cards
    dealer.clear_cards
  end

  private

  attr_writer :game_bank, :card_deck
end
