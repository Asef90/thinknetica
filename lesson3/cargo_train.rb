class CargoTrain < Train
  def hook_car(car)
    super if car.cargo_car?
  end

  def cargo_train?
    true
  end
end
