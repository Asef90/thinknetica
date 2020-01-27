class CargoTrain < Train
  def hook_car(car)
    super if car.cargo_car?
  end
end
