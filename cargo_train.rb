require_relative 'train'
class CargoTrain < Train
  @count = 0

  def initialize(number)
    @number = number
    @type = DEFAULT_TYPE
    @cars = []
    @route = nil
  end

  DEFAULT_TYPE = 'cargo'
end
