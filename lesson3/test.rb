require_relative 'train'
require_relative 'route'
require_relative 'station'

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
tr1 = Train.new("13", "gruz", 6)
tr2 = Train.new("14", "pass", 3)
tr3 = Train.new("15", "pass", 7)
st1.accept_train(tr1)
st2.accept_train(tr2)
st2.accept_train(tr3)
tr1.accept_route(route1)
tr2.accept_route(route2)
tr3.accept_route(route2)
puts tr1.current_station.name
puts tr2.current_station.name
puts tr3.current_station.name
puts tr1.next_station.name
puts tr1.previous_station
tr1.move_forward
puts tr1.current_station.name
tr1.move_back
puts tr1.current_station.name
