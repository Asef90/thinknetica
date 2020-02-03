class CargoTrain < Train

  def initialize(number)
    super(number)
    @type = "Cargo"
  end

  def hook_car(car)
    if car && car.cargo_car?
      super(car)
      self.cars_number += 1
      puts "Car is hooked."
    end
  end

  def cargo_train?
    true
  end
end
