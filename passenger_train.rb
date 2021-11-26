require_relative 'train'
class PassengerTrain < Train
  def initialize(number)
    @number = number
    @type = DEFAULT_TYPE
    @cars = []
    @route = nil
  end

  DEFAULT_TYPE = 'passenger'
end
