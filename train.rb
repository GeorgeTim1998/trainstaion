require_relative 'manufacturer_module'
require_relative 'instance_counter'
class Train
  attr_reader :type, :number
  attr_accessor :speed, :curr_station
  
  NUMBER_FORMAT = /(^[a-z\d]{3}$|^[a-z\d]{3}-{1}[a-z\d]{2})/
  include Manufacturer
  extend InstanceCount::ClassMethods
  include InstanceCount::InstanceMethods
  
  class << self
    attr_accessor :count
  end
  
  @@all_trains = []
  
  def self.find(number)
    @@all_trains.find { |train| train.number == number }
  end
  
  def initialize(number, type)
    @number = number
    @type = type
    @cars = []
    @route = nil
    @@all_trains << self
    validate!
    register_instance
  end
  
  def validate!
    raise 'Incorrect number format' if @number !~ NUMBER_FORMAT
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  def stop
    self.speed = 0
  end
  
  def add_car(car)
    stop
    @cars << car if same_type(car)
  end
  
  def delete_car
    stop
    @cars.delete(@cars[-1])
  end
  
  def accept_route(route)
    @route = route
    self.curr_station = @route.stations[0]
  end
  
  def forward
    self.curr_station = next_station if next_station
  end
  
  def backward
    self.curr_station = prev_station if prev_station
  end

  def prev_station
    index = @route.stations.find_index(curr_station)
    
    if index.zero?
      puts "There is no previous station. The train is at the departure '#{@route.stations[0]}'!"
    else
      @route.stations[index - 1]
    end
  end
  
  def next_station
    index = @route.stations.find_index(curr_station)
    
    if index == @route.stations.length - 1
      puts "There is no next station. The train is at the destination '#{@route.stations[-1]}'!"
    else
      @route.stations[index + 1]
    end
  end
  
  def same_type(car)
    @type == car.type
  end
end
