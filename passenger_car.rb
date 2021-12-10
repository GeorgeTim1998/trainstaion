require_relative 'car'
class PassCar < Car
  # с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться
  attr_reader :seats_amount

  def initialize(seats_amount)
    @type = DEFAULT_TYPE
    @seats_amount = seats_amount
    @occupied_seats = 0 
    validate!
  end

  def take_seat
    @occupied_seats += 1 if @occupied_seats < @seats_amount
  end

  def taken_seats
    @occupied_seats
  end

  def free_seats
    @seats_amount - @occupied_seats
  end
  
  protected
  
  DEFAULT_TYPE = 'passenger'

  def validate!
    raise 'Incorrect seats amount. Must be positive integer!' unless @seats_amount.is_a?(Integer) && @seats_amount.positive?
  end
end
