class PassCar < Car
  # с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться
  def initialize
    @type = DEFAULT_TYPE
  end

  DEFAULT_TYPE = 'passenger'
end
