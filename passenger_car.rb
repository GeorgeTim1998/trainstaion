require_relative 'car'
require_relative 'cargo_car'
require_relative 'cargo_train'
require_relative 'interface'
require_relative 'passenger_car'
require_relative 'passenger_train'
require_relative 'route'
require_relative 'station'
require_relative 'train'

class PassCar < Car
  protected # с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться
  
  def initialize
    @type = DEFAULT_TYPE
  end

  DEFAULT_TYPE = 'passenger'
end