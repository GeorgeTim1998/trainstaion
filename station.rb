require_relative 'instance_counter'
require_relative 'validation'
class Station
  extend InstanceCount::ClassMethods
  include InstanceCount::InstanceMethods
  extend Validation::ClassMethods
  include Validation::InstanceMethods

  attr_reader :trains, :name

  NAME_LENGTH = 6  

  validate(:@name, :type, String)
  validate(:@name, :word_length, NAME_LENGTH)

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
end
