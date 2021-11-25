require_relative 'train'

class CargoTrain < Train
  def initialize(number)
    @number = number
    @type = DEFAULT_TYPE
    @cars = []
    @route = nil
  end

  def add_car(car)
    stop
    @cars << car
  end

  DEFAULT_TYPE = 'cargo'
end
