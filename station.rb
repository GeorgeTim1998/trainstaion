require_relative 'instance_counter'
class Station
  extend InstanceCount::ClassMethods
  include InstanceCount::InstanceMethods
  attr_reader :trains, :name
  
  class << self
    attr_accessor :count
  end
  
  @count = 0
  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
  end

  def arrive(train)
    trains << train
  end

  def depart(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def trains_by_type_amount(type)
    puts "Trains of '#{type}' type is:"
    trains_by_type(type).count
  end
end
