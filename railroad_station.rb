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

  def trains_by_type(type)
    trains.select { |train| train.type == type }
  end

  def trains_by_type_amount(type)
    puts "Trains of '#{type}' type is:"
    trains_by_type(type).count
  end
end

class Route
  attr_reader :stations

  def initialize(departure, destination)
    @stations = [departure, destination]
  end

  def add_waypoint(waypoint)
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

  def add_car
    stop
    self.car_amount += 1
  end

  def delete_car
    stop
    if self.car_amount.zero?
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
    self.curr_station = next_station if next_station
  end

  def backward
    self.curr_station = prev_station if prev_station
  end

  def prev_station
    index = @route.stations.find_index(curr_station)

    if index.zero?
      puts "There is no previous station. The train is at the departure '#{@route.stations[0]}'!"
    else
      @route.stations[index - 1]
    end
  end

  def next_station
    index = @route.stations.find_index(curr_station)

    if index == @route.stations.length - 1
      puts "There is no next station. The train is at the destination '#{@route.stations[-1]}'!"
    else
      @route.stations[index + 1]
    end
  end
end
