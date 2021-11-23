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
  attr_accessor :action 
  def initialize
    puts "Do one of the following:\n\n"
    puts "Input '0' to create station;"
    puts "Input '1' to create train;"
    puts "Input '2' to create route;"

    puts "\tInput '2a' to add waypoint to route;"
    puts "\tInput '2d' to delete waypoint from route;"

    puts "Input '3' to assign route to train;"
    puts "Input '4' to add cars to train;"
    puts "Input '5' to delete cars from train;"

    puts "Input '6f' to move train forward;"
    puts "Input '6b' to move train backward;"
    
    puts "Input '7ls' to list available stations;"
    puts "Input '7lt' to list trains at the station;"
    
  end

  def inter_gets
    self.action = gets.chomp
  end
end