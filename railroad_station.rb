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
    train.accept_route
    trains.delete(train)
  end

  def trains_type
    trains.sort_by(&:type)
  end

  def trains_type_amount
    trains_amount = trains.count { |train| train.type == 'cargo' }
    [trains_amount, trains.length - trains_amount]
  end
end

class Route
  attr_reader :stations

  def initialize(departure, destination)
    @departure = departure
    @destination = destination
    @stations = []

    @stations = [departure, destination]
  end

  def add_waypoint(waypoint)
    stations_amount = stations.length
    stations.insert(stations_amount - 1, waypoint)
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

  def change_car_amount(what_to_do)
    stop

    case what_to_do
    when 1
      self.car_amount += 1
    when -1
      self.car_amount -= 1
    else
      puts "Don't know what you want from me! Try again)"
    end
  end

  def accept_route(route)
    @route = route.stations
    self.curr_station = @route[0]
  end

  def forward
    index = @route.find_index(curr_station)

    case index
    when @route.length - 1
      puts "Can't go further!"
    else
      self.curr_station = @route[index + 1]
    end
  end

  def backward
    index = @route.find_index(curr_station)

    case index
    when 0
      puts "Can't go further!"
    else
      self.curr_station = @route[index - 1]
    end
  end

  def show_route
    index = @route.find_index(curr_station)

    case index
    when 0
      @route[index, 2]
    when @route.length - 1
      @route[index - 1, 2]
    else
      @route[index - 1, 3]
    end
  end
end
