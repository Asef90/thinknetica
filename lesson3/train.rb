class Train
  include Manufacturer
  include InstanceCounter
  include Validator
  attr_reader :type, :number, :speed, :route, :current_station, :cars

  NUMBER_FORMAT = /^([a-z0-9]){3}-?([a-z0-9]){2}$/i

  @@all_trains = {}

  def initialize(number)
    @number = number
    validate!
    @cars = []
    @speed = 0
    @@all_trains[number] = self
    register_instance
  end

  def self.all
    @@all_trains.values
  end

  def self.find(number)
    @@all_trains[number]
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
    if speed == 0 && cars.include?(car)
      cars.delete(car)
      puts "Car is unhooked."
    end
  end

  def accept_route(route)
    if route
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
    else
      puts "This is the terminal station."
    end
  end

  def move_back
    if previous_station
      self.ready_move = true
      current_station.send_train(self)
      self.current_station = previous_station
      current_station.accept_train(self)
      self.ready_move = false
    else
      puts "This is the starting station."
    end
  end

  def ready_move?
    @ready_move
  end

  def just_routed?
    @just_routed
  end

  def passenger_train?
  end

  def cargo_train?
  end

  protected
  def validate!
    raise "Number cannot be empty." if number.nil?
    raise "Number must contain 5 or 6 characters" unless (5..6).include?(number.size)
    raise "Number must match format 'xxx-xx' or 'xxxxx'" if number !~ NUMBER_FORMAT
  end

  attr_writer :speed, :route, :current_station, :cars, :ready_move, :just_routed
end
