require_relative 'instance_counter'
class Station
  extend InstanceCount::ClassMethods
  include InstanceCount::InstanceMethods
  
  attr_reader :trains, :name

  NAME_LENGTH = 6
  class << self
    attr_accessor :count
  end
  
  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@all_stations << self
  end
  
  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  def all_trains(&block)
    @trains.each { |train| block.call(train) } if block_given?
  end 

  def arrive(train)
    @trains << train
  end
  
  def depart(train)
    @trains.delete(train)
  end
  
  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end
  
  def trains_by_type_amount(type)
    puts "Trains of '#{type}' type is:"
    trains_by_type(type).count
  end
  
  protected

  def validate!
    raise "Incorrect name length. Must be exactly #{NAME_LENGTH} characters long." if @name.length != NAME_LENGTH
  end
end
