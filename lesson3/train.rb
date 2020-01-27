class Train
  attr_accessor :speed, :route, :current_station, :cars
  attr_reader :type

  def initialize(number)
    @number = number
    @cars = []
    @speed = 0
    @ready_move = false
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
    if route && route.start_station
      self.just_routed = true
      self.route = route
      self.current_station = route.start_station
      current_station.accept_train(self)
      self.just_routed = false
    end
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
    if next_station
      self.ready_move = true
      current_station.send_train(self)
      self.current_station = next_station
      current_station.accept_train(self)
      self.ready_move = false
    end
  end

  def move_back
    if previous_station
      self.ready_move = true
      current_station.send_train(self)
      self.current_station = previous_station
      current_station.accept_train(self)
      self.ready_move = false
    end
  end

  def ready_move?
    !!(@ready_move)
  end

  def just_routed?
    !!(@just_routed)
  end

  def passenger_train?
  end

  def cargo_train?
  end

  private
  #Переменная :ready_move для проверки, действительно ли наш поезд собрался
  #перемещаться, чтоб нельзя было просто выкинуть или внезапно
  #принять поезд из ниоткуда. Переменная :just_routed позволит единожды
  #добавить поезд к начальной станции из ниоткуда - при назначении маршрута.

  #Их можно проcмотреть (например, классе Station в методах :accept_train/
  #:send_train), но присваивать значения - только в методах :move
  # или :accept_train самого объекта.
  attr_writer :ready_move, :just_routed

end
