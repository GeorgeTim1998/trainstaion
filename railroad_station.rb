class Station
  def initialize(name)
    @name = name
  end

  def train_arrive
    puts "Train #{@name} arrived"
  end

  def train_depart
    puts "Train #{name} departed"
  end
end

class Route
  def initialize(departure, destination)
    @departure = departure
    @destination = destination
  end
end

class Train
  attr_reader :speed, :car_amount

  def initialize(number, type, car_amount)
    @number = number
    @type = type
    @car_amount = car_amount
  end

  def stop
    self.speed = 0
  end

  def change_car_amount(do)
    stop
    self.car_amount += do
  end

  def accept_route
    @station = "1st station"
  end

  # def method_name
    
  # end
end