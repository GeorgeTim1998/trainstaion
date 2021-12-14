require_relative 'validation'
class Car
  # с этими методами взаимодействует только класс Interface. От пользователя надо отгородиться
  attr_reader :type
  
  extend Validation::ClassMethods
  include Validation::InstanceMethods

  TYPE_FORMAT = /^cargo$|^passenger$/

  validate(:@type, :format, TYPE_FORMAT)

  def initialize(type)
    @type = type
    validate!
  end
end
