# frozen_string_literal: true

class PassengerCar < Car
  attr_reader :seats, :occupied_seats, :empty_seats

  def initialize(number, seats)
    super(number)
    @type = 'Passenger'
    @seats = seats
    @occupied_seats = 0
    @empty_seats = seats
  end

  def passenger_car?
    true
  end

  def take_seat
    return unless empty_seats.positive?

    self.occupied_seats += 1
    self.empty_seats -= 1
  end

  private

  attr_writer :occupied_seats, :empty_seats
end
