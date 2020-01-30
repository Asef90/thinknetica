class Route
  include InstanceCounter
  attr_reader :start_station, :end_station, :stations

  activate_instance_counter

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
    register_instance
  end

  def add_between(station)
    stations.insert(-2, station)
  end

  def delete_between(station)
    stations.delete(station) unless (station == start_station || station == end_station)
  end

  def show_stations
    stations.each { |station| puts "#{station.name}" }
  end
end
