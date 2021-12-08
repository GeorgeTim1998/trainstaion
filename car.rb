class Car
  # с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться
  attr_reader :type
  
  TYPE_FORMAT = /^cargo$|^passenger$/

  def initialize(type)
    @type = type
    validate!
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  protected 

  def validate!
    raise 'Incorrect type' if @type !~ TYPE_FORMAT 
  end
end
