require_relative 'car'

class CargoCar < Car
# с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться

  def initialize(volume)
    @type = DEFAULT_TYPE
    @volume = volume
    @occupied_volume = 0 
    validate!
  end

  def take_seat
    @occupied_volume += 1 if @occupied_volume < @volume
  end
  
  def taken_seats
    @occupied_volume
  end
  
  def free_seats
    @volume - @occupied_volume
  end
  
  protected
  
  DEFAULT_TYPE = 'cargo'

  def validate!
    raise 'Incorrect volume. Must be positive integer!' unless @volume.is_a?(Integer) && @volume.positive?
  end
end