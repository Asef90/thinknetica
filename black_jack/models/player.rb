class Player
  attr_reader :cards, :num_of_cards, :bank

  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
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
    raise "No such amount in the bank" if amount > self.bank

    self.bank -= amount
  end

  def points
    total = 0
    cards.each { |card| total += card.value }
    total -= 10 if total > 21 && cards.detect { |card| card.rank == "A" }
    total
  end

  private

  attr_writer :cards, :bank

end
