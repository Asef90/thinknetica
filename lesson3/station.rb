class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def send_train(train)
    send_train!(train) if train.ready_move?
  end

  def accept_train(train)
    accept_train!(train) if train.ready_move? || train.just_routed?
  end

  def show_trains
    count_cargo = 0
    count_passenger = 0
    trains.each do |train|
      if train.cargo_train?
        count_cargo += 1
      else
        count_passenger += 1
      end
    end
    puts ("There are #{count_passenger} passenger and #{count_cargo} \
cargo trains")
  end

  private
  #Методы, непосредственно добавляющие и удаляющие поезда со станций,
  #должны быть приватными, так как это внутренняя работа при перемещении
  #поездов. И она не должна быть доступна никому.
  def accept_train!(train)
    trains << train unless trains.include?(train)
  end

  def send_train!(train)
    trains.delete(train) if trains.include?(train)
  end

end
