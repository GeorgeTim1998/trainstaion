require_relative 'train'
class CargoTrain < Train
  def initialize(number)
    @number = number
    @type = DEFAULT_TYPE
    @cars = []
    @route = nil
    validate!
    register_instance
  end

  DEFAULT_TYPE = 'cargo'
end