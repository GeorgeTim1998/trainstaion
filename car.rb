class Car
  # с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться
  attr_reader :type

  def initialize(type)
    @type = type
  end
end
