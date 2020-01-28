require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'

@stations = []
@trains = []
@routes = []
@cars = []

#Create station methods
def enter_station_name
  puts "Enter station name:"
  station_name = gets.chomp
end

def find_station(station_name)
  @stations.select { |station| station.name == station_name }[0]
end

def create_station(name)
  unless find_station(name)
    station = Station.new(name)
    @stations << station
    puts "Station is created."
  else
    puts "Already exist."
  end
end

#Create train methods
def enter_train_number
  puts "Enter train number:"
  number = gets.chomp.to_i
end

def enter_train_type
  puts "Enter train type:"
  puts "1. Passenger train."
  puts "2. Cargo train."
  type = gets.chomp.to_i
end

def find_train(number)
  @trains.select { |train| train.number == number }[0]
end

def create_train(number, train_type)
  unless find_train(number)
    if train_type == 1
      train = PassengerTrain.new(number)
    elsif train_type == 2
      train = CargoTrain.new(number)
    else
      puts select_error
    end
    if train
      @trains << train
      puts "Train is created."
    end
  else
    puts "Error. Already exist."
  end
end

#Route methods
def enter_route_action
  puts "Enter action:"
  puts "1. Create route."
  puts "2. Change route."
  action = gets.chomp.to_i
end

def enter_start_end_names
  puts "Enter route's start station name."
  start_name = gets.chomp
  puts "Enter route's end station name."
  end_name = gets.chomp
  return start_name, end_name
end

def find_route (start_name, end_name)
  @routes.select { |route| route.start_station.name == start_name &&
    route.end_station.name == end_name }[0]
end

def create_route(start_name, end_name)
  unless find_route(start_name, end_name)
    if (start_station = find_station(start_name)) && end_station = find_station(end_name)
      route = Route.new(start_station, end_station)
      @routes << route
      puts "Route is created."
    else
      puts "Please check if your stations exist."
    end
  else
    puts "Error. Already exist."
  end
end

def add_station(start_name, end_name, name_to_add)
  station_to_add = find_station(name_to_add)
  if (route = find_route(start_name, end_name)) && station_to_add
    route.add_between(station_to_add)
    puts "Station is added to route."
  else
    puts "There is no such route or station."
  end
end

#Assign route methods
def assign_route(train_number, start_name, end_name)
  train = find_train(train_number)
  route = find_route(start_name, end_name)
  if train && route
    if train.route != route
      train.accept_route(route)
      puts "Route is assigned."
    else
      puts "Route is already assigned."
    end
  else
    puts "No train or route."
  end
end

#Car methods
def enter_car_number
  puts "Enter car number"
  car_number = gets.chomp.to_i
end

def enter_car_type
  puts "Enter car type"
  puts "1. Passenger car."
  puts "2. Cargo car."
  car_type = gets.chomp.to_i
end

def enter_car_action
  puts "Enter action:"
  puts "1. Hook car."
  puts "2. Unhook car."
  action = gets.chomp.to_i
end

def find_car(number)
  @cars.select { |car| car.number == number }[0]
end

def get_car(number, type)
  unless car = find_car(number)
    if type == 1
      car = PassengerCar.new(number)
    elsif type == 2
      car = CargoCar.new(number)
    else
      puts select_error
    end
    $cars << car if car
  end
  car
end

def car_is_hooked?(car)
  @trains.select { |train| train.cars.include?(car) }[0]
end

def change_cars(train, car, action)
  if action == 1
    unless car_is_hooked?(car)
      train.hook_car(car)
    else
      puts "Car hook error."
    end
  elsif action == 2
    train.unhook_car(car)
  else
    puts select_error
  end
end

def find_and_change(train_number, car_number, car_type, action)
  train = find_train(train_number)
  car = get_car(car_number, car_type)
  if train
    change_cars(train, car, action)
  else
    puts "Error. No such train."
  end
end

#Move methods
def enter_move_direction
  puts "Enter move direction:"
  puts "1. Move forward."
  puts "2. Move back."
  direction = gets.chomp.to_i
end

def move(train_number, move_direction)
  train = find_train(train_number)
  if train
    if move_direction == 1
      train.move_forward
    elsif move_direction == 2
      train.move_back
    else
      puts select_error
    end
  else
    puts "No such train."
  end
end

#Show info methods
def show_stations
  @stations.each { |station| puts station.name }
end

def show_trains(station_name)
  if station = find_station(station_name)
    station.show_trains
  else
    puts "Error. There is no such station."
  end
end

# Enter menu method
def start_menu
  puts "\nPlease select an action number:"
  puts "1. Create station."
  puts "2. Create train."
  puts "3. Create or change route."
  puts "4. Assign a route for the train."
  puts "5. Hook / unhook cars."
  puts "6. Move a train along a route."
  puts "7. Get stations or trains info."

  puts "--Print 'exit' for exit--"
end

#Error method
def select_error
  "Error. Invalid number"
end


while true
  start_menu
  answer = gets.chomp
  case answer
  when "1"
    station_name = enter_station_name
    create_station(station_name)
  when "2"
    train_number = enter_train_number
    train_type = enter_train_type
    create_train(train_number, train_type)
  when "3"
    action = enter_route_action
    start_name, end_name = enter_start_end_names
    if action == 1
      create_route(start_name, end_name)
    elsif action == 2
      station_to_add_name = enter_station_name
      add_station(start_name, end_name, station_to_add_name)
    else
      puts select_error
    end
  when "4"
    train_number = enter_train_number
    start_name, end_name = enter_start_end_names
    assign_route(train_number, start_name, end_name)
  when "5"
    train_number = enter_train_number
    car_number = enter_car_number
    car_type = enter_car_type
    action = enter_car_action
    find_and_change(train_number, car_number, car_type, action)
  when "6"
    train_number = enter_train_number
    direction = enter_move_direction
    move(train_number, direction)
  when "7"
    show_stations
    station_name = enter_station_name
    show_trains(station_name)
  when "exit"
    break
  end
end
