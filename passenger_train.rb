require_relative 'car'
require_relative 'cargo_car'
require_relative 'cargo_train'
require_relative 'interface'
require_relative 'passenger_car'
require_relative 'passenger_train'
require_relative 'route'
require_relative 'station'
require_relative 'train'

class PassengerTrain < Train
  def initialize(number)
    @number = number
    @type = DEFAULT_TYPE
    @route = nil
  end

  DEFAULT_TYPE = 'passenger'
end