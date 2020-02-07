# frozen_string_literal: true

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

  # rubocop:disable Style/MultipleComparison
  def delete_between(station)
    return if station == start_station || station == end_station

    stations.delete(station)
  end
  # rubocop:enable Style/MultipleComparison

  def show_stations
    stations.each { |station| puts station.name.to_s }
  end

  private

  def validate!
    return unless start_station.nil? || end_station.nil?

    raise 'The start and end stations must be present.'
  end
end
