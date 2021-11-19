class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive(train)
    trains << train
  end

  def depart(train)
    trains.delete(train)
  end

  def trains_type
    trains.sort_by(&:type) 
    #А почему здесь сортировка? лучше добавить аргумент type к методу и возвращать массив вагонов определенного типа
  end

  def trains_type_amount
    trains_amount = trains.count { |train| train.type == 'cargo' }
    #Тоже самое, массив массивов. Сделай аргумент к методу и все
    [trains_amount, trains.length - trains_amount]
  end
end

class Route
  attr_reader :stations

  def initialize(departure, destination)
    # @departure = departure
    # @destination = destination
    # @stations = []
    @stations = [departure, destination]
  end

  def add_waypoint(waypoint)
    # stations_amount = stations.length
    stations.insert(-2, waypoint)
  end

  def delete_waypoint(waypoint)
    stations.delete(waypoint) if (waypoint != @departure) && (waypoint != @destination)
  end

  def show_route
    puts stations
  end
end

class Train
  attr_reader :type
  attr_accessor :speed, :car_amount, :curr_station

  def initialize(number, type, car_amount)
    @number = number
    @type = type
    @car_amount = car_amount
    @route = nil
  end

  def stop
    self.speed = 0
  end

  # def change_car_amount(what_to_do)
  #   stop

  #   case what_to_do
  #   when 1
  #     self.car_amount += 1
  #   when -1
  #     self.car_amount -= 1
  #   else
  #     puts "Don't know what you want from me! Try again)"
  #   end
  # end

  def add_car
    stop
    self.car_amount += 1
  end

  def delete_car
    stop
    if self.car_amount == 0
      puts "There is already zero cars! Can't delete cars futher!"
    else
      self.car_amount += -1
    end
  end

  def accept_route(route)
    @route = route
    self.curr_station = @route.stations[0]
  end

  def forward
    index = @route.stations.find_index(curr_station)

    case index
    when @route.stations.length - 1
      puts "Can't go further!"
    else
      self.curr_station = @route.stations[index + 1]
    end
  end

  def backward
    index = @route.stations.find_index(curr_station)

    case index
    when 0
      puts "Can't go further!"
    else
      self.curr_station = @route.stations[index - 1]
    end
  end
  
  def prev_station
    index = @route.stations.find_index(curr_station)

    if index == 0
      puts "There is no previous station. The train is at the departure!"
    else
      @route.stations[index - 1]
    end
  end

  def next_station
    index = @route.stations.find_index(curr_station)

    if index == @route.stations.length - 1
      puts "There is no next station. The train is at the destination!"
    else
      @route[index + 1]
    end
  end
end
