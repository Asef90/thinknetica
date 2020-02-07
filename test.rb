require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'


st1 = Station.new("Nakhabino")
st2 = Station.new("Podolsk")
st3 = Station.new("Anikeevka")
st4 = Station.new("Opalikha")
st5 = Station.new("Krasnogorskaya")
st6 = Station.new("Pavshino")
st7 = Station.new("Silikatnaya")
st8 = Station.new("Ostafyevo")
st9 = Station.new("Scherbinka")
st10 = Station.new("Butovo")
route1 = Route.new(st1, st2)
route2 = Route.new(st2, st1)
route1.add_between(st3)
route1.add_between(st4)
route1.add_between(st5)
route1.add_between(st6)
route2.add_between(st7)
route2.add_between(st8)
route2.add_between(st9)
route2.add_between(st10)
tr1 = CargoTrain.new("13")
tr2 = PassengerTrain.new("14")
tr3 = PassengerTrain.new("15")
st1.accept_train(tr1)
st2.accept_train(tr2)
st2.accept_train(tr3)
tr1.accept_route(route1)
tr2.accept_route(route2)
tr3.accept_route(route2)
puts route1.start_station.name
puts route1.end_station.name

=begin
puts tr1.current_station.name
puts tr2.current_station.name
puts tr3.current_station.name
puts tr1.next_station.name
puts tr1.previous_station
tr2.move_forward
puts tr1.current_station.name
tr3.move_forward
puts tr1.current_station.name
st2.show_trains
=end
