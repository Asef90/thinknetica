def seed
  st1 = Station.new('Nakhabino')
  st2 = Station.new('Podolsk')
  st3 = Station.new('Anikeevka')
  st4 = Station.new('Opalikha')
  st5 = Station.new('Krasnogorskaya')
  st6 = Station.new('Pavshino')
  st7 = Station.new('Silikatnaya')
  st8 = Station.new('Ostafyevo')
  st9 = Station.new('Scherbinka')
  st10 = Station.new('Butovo')
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
  tr1 = CargoTrain.new('11111')
  tr2 = PassengerTrain.new('22222')
  tr3 = PassengerTrain.new('33333')
  tr1.accept_route(route1)
  tr2.accept_route(route2)
  tr3.accept_route(route2)
  stations = [st1, st2, st3, st4, st5, st6, st7, st8, st9, st10]
  trains = [tr1, tr2, tr3]
  routes = [route1, route2]
  [stations, trains, routes]
end
