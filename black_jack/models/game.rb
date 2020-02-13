class Game
  BET = 10
  NUM_OF_PLAYERS = 2

  attr_reader :player, :dealer, :card_deck, :game_bank

  def initialize(player)
    @dealer = Player.new("Dealer")
    @player = player
    @card_deck = CardDeck.new
  end

  def give_card(player)
    player.add_card(card_deck.draw_card)
  end

  def take_bets
    dealer.reduce_bank(BET)
    player.reduce_bank(BET)
    self.game_bank = NUM_OF_PLAYERS * BET
  end

  def deal_cards_first_time
    2.times { give_card(player) }
    2.times { give_card(dealer) }
  end

  def dealer_move
    give_card(dealer) if dealer.points < 17
  end

  def show_cards(player)
    dealer.show_cards
    player.show_cards
  end

  def pay_bank(player)
    player.increase_bank(game_bank)
  end

  private

  attr_writer :game_bank

end
