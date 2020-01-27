class PassengerTrain < Train
  def hook_car(car)
    super if car.passenger_car?
  end

  def passenger_train?
    true
  end
end
