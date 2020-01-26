class Route
  attr_reader :start_station, :end_station, :between_stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @between_stations = []
  end

  def add_between(station)
    between_stations << station
  end

  def delete_between(station)
    between_stations.delete(station)
  end

  def stations
    between_stations.dup.unshift(start_station).push(end_station)
  end

  def show_stations
    puts start_station.name
    between_stations.each {|station| puts "#{station.name}"}
    puts end_station.name
  end
end
