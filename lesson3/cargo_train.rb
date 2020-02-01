class CargoTrain < Train

  def hook_car(car)
    if car && car.cargo_car?
      super
      puts "Car is hooked."
    end
  end

  def cargo_train?
    true
  end
end
