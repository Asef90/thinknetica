require_relative 'card'

class CardDeck
  SUITE = ["♠", "♥", "♣", "♦"]
  RANK = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  attr_reader :deck

  def initialize
    @deck = build_card_deck
  end

  def draw_card
    raise "No cards in deck" if deck.empty?

    deck.pop
  end

  private

  def build_card_deck
    temp_deck = []
    SUITE.each do |suite|
      RANK.each do |rank|
        card = Card.new(suite, rank)
        temp_deck << card
      end
    end
    temp_deck.shuffle!
  end

end
