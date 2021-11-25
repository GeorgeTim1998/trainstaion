require_relative 'car'
require_relative 'cargo_car'
require_relative 'cargo_train'
require_relative 'interface'
require_relative 'passenger_car'
require_relative 'passenger_train'
require_relative 'route'
require_relative 'station'
require_relative 'train'

class CargoTrain < Train
  def initialize(number)
    @number = number
    @type = DEFAULT_TYPE
    @route = nil
  end

  def add_car
    stop
    @cars << CargoCar.new
  end

  def delete_car(car)
    stop
    @cars.delete(car)
  end

  DEFAULT_TYPE = 'cargo'
end