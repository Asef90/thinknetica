st1 = Station.new("Pavshino")
st2 = Station.new("Lyubertsy")
route1 = Route.new("Pavshino", "Lyubertsy")
route2 = Route.new("Lyubertsy", "Pavshino")
route1.add_between("Ab")
route1.add_between("Ac")
route1.add_between("Ad")
route1.add_between("Ae")
route2.add_between("Zx")
route2.add_between("Zy")
route2.add_between("Zw")
route2.add_between("Zv")
tr1 = Train.new("13", "gruz", 6)
tr2 = Train.new("14", "pass", 3)
tr3 = Train.new("15", "pass", 7)
st1.accept_train(tr1)
st2.accept_train(tr2)
st2.accept_train(tr3)
tr1.accept_route(route1)
tr2.accept_route(route2)
tr3.accept_route(route2)
puts tr1.current_station
puts tr2.current_station
puts tr3.current_station
puts tr1.next_station
puts tr1.previous_station
tr1.move("forward")
puts tr1.current_station
