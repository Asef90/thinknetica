class Route
  include InstanceCounter
  include Validation

  attr_reader :start_station, :end_station, :stations

  validate :start_station, :presence
  validate :end_station, :presence
  validate :start_station, :type, Station
  validate :end_station, :type, Station

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

  # rubocop:disable Style/MultipleComparison
  def delete_between(station)
    return if station == start_station || station == end_station

    stations.delete(station)
  end
  # rubocop:enable Style/MultipleComparison

  def show_stations
    stations.each { |station| puts station.name.to_s }
  end
end
