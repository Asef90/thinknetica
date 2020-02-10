class PassengerTrain < Train
  def initialize(number)
    super(number)
    @type = 'Passenger'
  end

  def hook_car(car)
    return unless car&.passenger_car?

    super(car)
    self.cars_number += 1
    puts 'Car is hooked.'
  end

  def passenger_train?
    true
  end
end
