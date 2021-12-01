require_relative 'instance_counter'
class Route
  extend InstanceCount::ClassMethods
  include InstanceCount::InstanceMethods
  
  class << self
    attr_accessor :count
  end
  
  attr_reader :stations

  def initialize(departure, destination)
    @stations = [departure, destination]
  end

  def add_waypoint(waypoint)
    stations.insert(-2, waypoint)
  end

  def delete_waypoint(waypoint)
    stations.delete(waypoint) if (waypoint != @stations[0]) and (waypoint != @stations[-1])
  end

  def show_route
    puts stations
  end
end
