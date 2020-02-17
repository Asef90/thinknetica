class Player
  attr_reader :name, :cards, :bank

  def initialize(name, bank = 100)
    @name = name
    @cards = []
    @bank = bank
  end

  def add_card(card)
    cards << card
  end

  def clear_cards
    cards.clear
  end

  def increase_bank(amount)
    self.bank += amount
  end

  def reduce_bank(amount)
    self.bank -= amount if amount <= self.bank
  end

  def points
    total = cards.inject(0) { |sum, card| sum + card.value }
    total -= 10 if total > 21 && cards.detect { |card| card.rank == 'A' }
    total
  end

  def num_of_cards
    cards.size
  end

  private

  attr_writer :cards, :bank
end
