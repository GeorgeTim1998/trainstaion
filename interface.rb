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
    show_commands
    init_action
  end
  
  private 
  # здесь лежат методы, которые касаются только внутренней логики класса Interface:
  # проверка введенных данных, усправление объектами других классов и т.д. 
  # Пользователь не должен иметь к этому доступ
  attr_accessor :action, :stations
  
  def show_commands
    puts "\nDo one of the following:".blue
    puts "Pass '0' to create station;"
    puts "Pass '1' to create train;"
    puts "Pass '2' to create route;"
    
    puts "\tPass '2a' to add waypoint to route;"
    puts "\tPass '2d' to delete waypoint from route;"
    
    puts "Pass '3' to assign route to train;"
    puts "Pass '4' to add cars to train;"
    puts "Pass '5' to delete cars from train;"
    
    puts "Pass '6f' to move train forward;"
    puts "Pass '6b' to move train backward;"
    
    puts "Pass '7ls' to list available stations;"
    puts "Pass '7lt' to list trains at the station."
    
    puts "Pass 'exit' to stop."
    
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
    when '1'
      create_train
    when '2'
      create_toute
    when '2a'
      add_waypoint
    when '2b'
      delete_waypoint
    when '3'
    when '4'
    when '5'
    when '6f'
    when '6b'
    when '7ls'
      list_stations
    when '7lt'
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

  def list_stations
    puts "Stations:".green
    self.stations.each_with_index { |item, index| puts "index: #{index} for #{item.name}"}
  end

  def create_train
   self.trains << Train.new() 
  end
end