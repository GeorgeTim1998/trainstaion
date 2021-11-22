class Route
  attr_reader :stations

  def initialize(departure, destination)
    @stations = [departure, destination]
  end

  def add_waypoint(waypoint)
    stations.insert(-2, waypoint)
  end

  def delete_waypoint(waypoint)
    stations.delete(waypoint) if (waypoint != @departure) && (waypoint != @destination)
  end

  def show_route
    puts stations
  end
end