class PassengerTrain < Train
  def hook_car(car)
    if car && car.passenger_car?
      super
      puts "Car is hooked."
    else
      puts "It's not a passenger car."
    end
  end

  def passenger_train?
    true
  end
end
