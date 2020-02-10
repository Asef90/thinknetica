class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  NUMBER_FORMAT = /^([a-z0-9]){3}-?([a-z0-9]){2}$/i.freeze

  attr_reader :type, :number, :speed, :route, :current_station, :cars, :cars_number

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  # rubocop:disable Style/ClassVars
  @@all_trains = {}
  # rubocop:enable Style/ClassVars

  def initialize(number)
    @number = number
    #validate!
    @cars = []
    @speed = 0
    @cars_number = 0
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
    cars << car if speed.zero?
  end

  def unhook_car(car)
    return unless speed.zero? && cars.include?(car)

    cars.delete(car)
    self.cars_number -= 1
    puts 'Car is unhooked.'
  end

  def iterate_cars
    cars.each { |car| yield(car) }
  end

  def accept_route(route)
    return unless route

    self.just_routed = true
    self.route = route
    self.current_station = route.start_station
    current_station.accept_train(self)
    self.just_routed = false
  end

  def next_station
    i = route.stations.index(current_station)
    length = route.stations.size
    if i == length - 1
      nil
    else
      route.stations[i + 1]
    end
  end

  def previous_station
    i = route.stations.index(current_station)
    if i.zero?
      nil
    else
      route.stations[i - 1]
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
      puts 'This is the terminal station.'
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
      puts 'This is the starting station.'
    end
  end

  def ready_move?
    @ready_move
  end

  def just_routed?
    @just_routed
  end

  def passenger_train?; end

  def cargo_train?; end

  protected

  attr_writer :speed, :route, :current_station, :cars, :ready_move, :just_routed, :cars_number
end
