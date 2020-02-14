class Player
  attr_reader :name, :cards, :bank

  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
  end

  def add_card(card)
    raise 'Player can have only 3 cards' if num_of_cards == 3

    cards << card
  end

  def clear_cards
    cards.clear
  end

  def show_cards
    puts "#{name}'s cards:"
    cards.each { |card| puts "#{card.rank}#{card.suite}" }
    puts "Total #{points} points."
  end

  def increase_bank(amount)
    self.bank += amount
  end

  def reduce_bank(amount)
    raise 'No such amount in the bank' if amount > self.bank

    self.bank -= amount
  end

  def points
    total = 0
    cards.each { |card| total += card.value }
    total -= 10 if total > 21 && cards.detect { |card| card.rank == 'A' }
    total
  end

  def num_of_cards
    cards.size
  end

  private

  attr_writer :cards, :bank
end
