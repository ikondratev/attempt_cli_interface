class InteractionMenu
  attr_reader :trains

  def initialize
    @trains = []
  end

  def create_train
    puts "Enter trains type: "
    type = gets.chomp.to_s

    puts "Entre route: "
    route = gets.chomp.to_s

    @trains <<  Trains::Services::Factory.create_train(type: type, route: route)
  rescue BaseError => e
    puts e.message
  end

  def show
    show_available_objects

    show_available_actions

    show_exit_commands
  end

  def create_route
    # TODO: Implement me
  end

  def create_station
    # TODO: Implement me
  end

  private

  def show_available_actions
    puts "Available commands:"
    Config::Constants::AVAILABLE_ACTIONS.each do | _k, v|
      puts "----- #{v[:action]}\n"
    end
  end

  def show_exit_commands
    puts "Exit commands:"
    Config::Constants::EXIT_COMMANDS.each { |command| puts "----- #{command}\n" }
  end

  def show_available_objects
    puts "Available objects:"
    puts "----- Trains: #{@trains.size}" unless @trains.empty?
  end
end