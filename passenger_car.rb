require_relative 'car'
class PassCar < Car
  # с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться
  attr_reader :seats_amount

  def initialize(volume)
    @type = DEFAULT_TYPE
    @volume = volume
    @occupied_seats = 0 
    validate!
  end

  def take_seat
    @occupied_seats += 1 if @occupied_seats < @volume
  end

  def taken_seats
    @occupied_seats
  end

  def free_seats
    @volume - @occupied_seats
  end
  
  protected
  
  DEFAULT_TYPE = 'passenger'

  def validate!
    raise 'Incorrect seats amount. Must be positive integer!' unless @volume.is_a?(Integer) && @volume.positive?
  end
end
