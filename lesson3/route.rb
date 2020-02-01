class Route
  include InstanceCounter
  include Validator
  attr_reader :start_station, :end_station, :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    validate!
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

  private
  def validate!
    raise "The start and end stations must be present." if start_station.nil? || end_station.nil?
  end
end
