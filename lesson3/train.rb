class Train
  attr_accessor :speed, :route, :current_station, :cars
  attr_reader :type

  def initialize(number, type)
    @number = number
    @type = type
    @cars = []
    @speed = 0
  end

  def add_speed(speed)
    self.speed += speed
  end

  def brake
    self.speed = 0
  end

  def hook_car(car)
    cars << car if speed == 0
  end

  def unhook_car(car)
    cars.delete(car) if speed == 0 && cars.include?(car)
  end

  def accept_route(route)
    self.route = route
    self.current_station = route.start_station
  end

  def next_station
    i = route.stations.index(current_station)
    length = route.stations.size
    unless i == length - 1
      route.stations[i + 1]
    else
      return nil
    end
  end

  def previous_station
    i = route.stations.index(current_station)
    unless i == 0
      route.stations[i - 1]
    else
      return nil
    end
  end

  def move_forward
    current_station.send_train(self)
    self.current_station = next_station
    current_station.accept_train(self)
  end

  def move_back
    current_station.send_train(self)
    self.current_station = previous_station
    current_station.accept_train(self)
  end
end
