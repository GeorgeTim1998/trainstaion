require_relative 'car'

class CargoCar < Car
# с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться

  def initialize
    @type = DEFAULT_TYPE
  end

  DEFAULT_TYPE = 'cargo'
end