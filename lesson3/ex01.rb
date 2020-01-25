class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    trains << train if !(trains.include?(train))
  end

  def send_train(train)
    trains.delete(train) if trains.include?(train)
  end

  def get_trains(type)
    trains.map {|train| train if train.type == type}
  end
end

class Route
  attr_reader :start_station, :end_station, :between_stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @between_stations = []
  end

  def add_between(station)
    between_stations << station
  end

  def delete_between(station)
    between_stations.delete(station)
  end

  def show_stations
    puts start_station.name
    between_stations.each {|station| puts "#{station.name}"}
    puts end_station.name
  end
end

class Train
  attr_accessor :speed, :cars_number, :route, :current_station
  attr_reader :type

  def initialize(number, type, cars_number)
    @number = number
    @type = type
    @cars_number = cars_number
    @speed = 0
  end

  def add_speed(speed)
    self.speed += speed
  end

  def brake
    self.speed = 0
  end

  def change_cars(operation)
    if speed == 0
      case
      when operation == "hook"
        self.cars_number += 1
      when operation == "detach"
        self.cars_number -= 1
      end
    end
  end

  def accept_route(route)
    self.route = route
    self.current_station = route.start_station
  end

  def next_station
    case
    when current_station == route.start_station
      route.between_stations[0]
    when route.between_stations.include?(current_station)
      i = route.between_stations.index(current_station)
      len = route.between_stations.size
      if i == size - 1
        route.end_station
      else
        route.between_stations[i + 1]
      end
    end
  end

  def previous_station
    case
    when current_station == route.end_station
      route.between_stations[-1]
    when route.between_stations.include?(current_station)
      i = route.between_stations.index(current_station)
      if i == 0
        route.start_station
      else
        route.between_stations[i - 1]
      end
    end
  end

  def move(direction)
    current_station.send_train(self)
    self.current_station = case
      when direction == "forward"
        next_station if next_station
      when direction == "back"
        previous_station if previous_station
    end
    current_station.accept_train(self)
  end
end
