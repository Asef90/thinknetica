class Station
  include InstanceCounter
  include InstanceSaver
  include Validation

  attr_reader :name, :trains

  validate :name, :presence

  def initialize(name)
    @name = name
    validate!
    @trains = []
    add_instance
    register_instance
  end

  def iterate_trains
    trains.each { |train| yield(train) }
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
    puts "There are #{count_passenger} passenger and #{count_cargo} cargo trains."
  end

  private

  def accept_train!(train)
    trains << train unless trains.include?(train)
  end

  def send_train!(train)
    trains.delete(train) if trains.include?(train)
  end
end
