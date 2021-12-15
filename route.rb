require_relative 'instance_counter'
require_relative 'validation'
class Route
  include InstanceCount
  include Validation
  
  class << self
    attr_accessor :count
  end
  NAME_LENGTH = 4
  attr_reader :stations, :departure, :destination

  validate(:@departure, :type, String)
  validate(:@destination, :type, String)
  validate(:@departure, :word_length, NAME_LENGTH)
  validate(:@destination, :word_length, NAME_LENGTH)

  def initialize(departure, destination)
    @departure = departure
    @destination = destination
    @stations = [@departure, @destination]
    validate!
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
