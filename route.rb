require_relative 'instance_counter'
class Route
  extend InstanceCount::ClassMethods
  include InstanceCount::InstanceMethods
  
  class << self
    attr_accessor :count
  end
  NAME_LENGTH = 4
  attr_reader :stations

  def initialize(departure, destination)
    @stations = [departure, destination]
    validate!
  end

  
  def valid?
    validate!
    true
  rescue RuntimeError
    false
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
  
  protected
  
  def validate!
    raise "Incorrect name length. Must be >= #{NAME_LENGTH}" if @stations[0].length < NAME_LENGTH || @stations[1].length < NAME_LENGTH
  end
end
