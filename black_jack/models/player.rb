class Player
  attr_reader :cards, :num_of_cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  def clear_cards
    cards.clear
  end

  def points
    total = 0
    cards.each { |card| total += card.value }
    total -= 10 if total > 21 && cards.detect { |card| card.rank == "A" }
    total
  end

  private

  attr_writer :cards

end
