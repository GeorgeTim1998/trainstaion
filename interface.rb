require 'colorize'
require_relative 'car'
require_relative 'cargo_car'
require_relative 'cargo_train'
require_relative 'interface'
require_relative 'passenger_car'
require_relative 'passenger_train'
require_relative 'route'
require_relative 'station'
require_relative 'train'

class Interface
  
  def initialize
    @stations = []
    @trains = []
    @routes = []
    show_commands
    init_action
  end
  
  private 
  # здесь лежат методы, которые касаются только внутренней логики класса Interface:
  # проверка введенных данных, усправление объектами других классов и т.д. 
  # Пользователь не должен иметь к этому доступ
  attr_accessor :action, :stations, :trains, :routes
  
  def show_commands
    puts "\nDo one of the following:".blue
    
    puts "Create station".light_blue
    puts "\tPass '0' to create station;"

    puts "Create train:".light_blue
    puts "\tPass '1a' to create cargo train;"
    puts "\tPass '1b' to create passenger route;"
    
    puts "Manage routes:".light_blue
    puts "\tPass '2a' to create route;"
    puts "\tPass '2b' to add waypoint to route;"
    puts "\tPass '2c' to delete a waypoint from route;"
    puts "\tPass '2d' to assign route to train;"
    
    puts "Car managment:".light_blue
    puts "\tPass '3ac' to add cars to cargo train;"
    puts "\tPass '3ap' to add cars to passenger train;"
    puts "\tPass '3bc' to delete cars from cargo train;"
    puts "\tPass '3bp' to delete cars from passenger train;"
    
    puts "Move trains:".light_blue
    puts "\tPass '4a' to move train forward;"
    puts "\tPass '4b' to move train backward;"
    
    puts "Show info:".light_blue
    puts "\tPass '5a' to list available stations;"
    puts "\tPass '5b' to list trains at the station."
    
    puts "\nPass 'exit' to stop."
    
    puts "\n"
  end

  
  def init_action
    loop do
      interface_gets
      break if exit?
      do_action
    end
  end

  def do_action
    case self.action
    when '0'
      create_station
    when '1a'
      create_cargo_train
    when '1b'
      create_pass_train
    when '2a'
      create_route
    when '2b'
      add_waypoint
    when '2c'
      delete_waypoint
    when '2d'
      assign_route
    when '3a'
    when '3b'
    when '3c'
    when '3d'
      list_stations
    when '4a'
    when '4b'
    when '5a'
    when '5b'
    when 'commands'
      show_commands
    else
      warning!
    end
  end

  def interface_gets
    puts 'Your action is: '.blue
    self.action = gets.chomp
  end
  
  def exit?
    self.action == 'exit'
  end

  def warning!
    puts "WARNING! There is no such action! Pass 'commands' to see what's available.\n".yellow
  end

  def create_station
    puts "Input stations name:".light_blue
    station_name = gets.chomp
    self.stations << Station.new(station_name)
  end

  def create_cargo_train
    input_train
    self.trains << CargoTrain.new(self.action)
  end

  def create_pass_train
    input_train
    self.trains << PassengerTrain.new(self.action)
  end

  def input_train
    puts "How would you name your train?".blue
    interface_gets
  end
  
  def list_stations
    puts "Stations:".green
    self.stations.each_with_index { |item, index| puts "index: #{index} for #{item.name}"}
  end

  def create_route
    puts "Input departure:".cyan
    destination = gets.chomp
    puts "Input destination:".cyan
    departure = gets.chomp
    self.routes << Route.new(destination, departure) 
  end

  def add_waypoint
    available_routes

    puts "Select route to add waypoint to:".cyan
    route_num = gets.chomp.to_i
    
    puts "Input waypoint name".cyan
    waypoint = gets.chomp
    
    self.routes[route_num].add_waypoint(waypoint) if action_possible(self.routes, route_num)
  end

  def delete_waypoint
    available_routes

    puts "Select route to delete waypoint from:".cyan
    route_num = gets.chomp.to_i

    puts "Input waypoint name".cyan
    waypoint = gets.chomp

    self.routes[route_num].delete_waypoint(waypoint) if action_possible(self.routes, route_num)
  end

  def available_routes
    puts "Available routes:".cyan
    self.routes.each_with_index { |item, index| puts "index: #{index} for #{item.stations}"}
  end
  
  def available_trains
    puts "Available trains:".cyan
    self.trains.each_with_index { |item, index| puts "index: #{index} for #{item.inspect}"}
  end

  def action_possible(array, number)
    array.length - 1 >= number and number >= 0
  end

  def assign_route
    available_trains
    available_routes 
    
    puts "Select train:".cyan
    train_num = gets.chomp.to_i
    puts "Select route:".cyan
    route_num = gets.chomp.to_i

    @trains[train_num].accept_route(@routes[route_num]) \
    if action_possible(@trains, train_num) and action_possible(@routes, route_num)
  end
end