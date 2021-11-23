require_relative 'car'
require_relative 'cargo_car'
require_relative 'cargo_train'
require_relative 'interface'
require_relative 'passenger_car'
require_relative 'passenger_train'
require_relative 'route'
require_relative 'station'
require_relative 'train'

class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
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