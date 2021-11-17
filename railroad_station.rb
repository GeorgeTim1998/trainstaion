class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive(train)
    self.trains << train
  end

  def depart(train)
    train.accept_route
    trains.delete(train)
  end

  def trains_type
    puts 'Passanger trains:'
    trains.each { |train| puts train.inspect if train.type.include?('passanger') }

    puts "\n"

    puts 'Cargo trains:'
    trains.each { |train| puts train.inspect if train.type.include?('cargo') }
    
    puts "\n"
  end

  def trains_type_amount
    trains_amount = trains.count { |train| train.type == 'passanger' }
    puts "Passanger trains = #{trains_amount}"

    puts "\n"

    puts "Cargo trains = #{trains.length - trains_amount}"
    #trains.each { |train, num| train[num] += 1 if train.type.include?('cargo') }
  end
end

class Route
  def initialize(departure, destination)
    @departure = departure
    @destination = destination
  end
end

class Train
  attr_reader :speed, :car_amount, :type 

  def initialize(number, type, car_amount)
    @number = number
    @type = type
    @car_amount = car_amount
  end

  def stop
    self.speed = 0
  end

  def change_car_amount(amount)
    stop
    self.car_amount += amount
  end

  def accept_route
    @station = "1st station"
  end

  # def method_name
    
  # end
end