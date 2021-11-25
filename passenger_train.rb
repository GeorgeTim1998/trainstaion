require_relative 'train'

class PassengerTrain < Train
  def initialize(number)
    @number = number
    @type = DEFAULT_TYPE
    @cars = []
    @route = nil
  end

  def add_car
    stop
    @cars << PassCar.new
  end

  DEFAULT_TYPE = 'passenger'
end