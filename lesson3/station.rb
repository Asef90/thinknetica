class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    trains << train unless trains.include?(train)
  end

  def send_train(train)
    trains.delete(train) if trains.include?(train)
  end

  def show_trains
    count_cargo = 0
    cont_passenger = 0
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
end
