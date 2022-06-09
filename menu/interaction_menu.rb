require './menu/commands/train'

module Menu
  class InteractionMenu
    include Menu::Commands::Train

    attr_reader :trains

    def initialize
      @objects = {
        trains: []
      }
    end

    def create_train
      puts "Enter trains type:"
      type = gets.chomp.to_s

      puts "Entre number:"
      number = gets.chomp.to_i

      @objects[:trains] <<  Trains::Services::Factory.create_train(type: type, number: number)
    rescue StandardError => e
      raise Menu::InteractionMenuError, e.message
    end

    def show
      clear

      puts "Available objects:"
      show_available_objects

      taping_info(Config::Constants::AVAILABLE_ACTIONS, "Available commands:")

      taping_info(Config::Constants::EXIT_COMMANDS, "Exit commands:")
    end

    def present_objects
      puts "Choose objects group:"
      show_available_objects

      user_choice = gets.chomp.to_sym

      raise "Unavailable object" unless @objects.include?(user_choice.to_sym)

      collection = @objects[user_choice.to_sym]

      taping_info(collection, user_choice)

      puts "Choose object's index:"
      index_object = gets.chomp.to_i

      obj = collection[index_object]
      puts obj.to_s

      puts "Choose index action for #{user_choice}"
      taping_info(Config::Constants::OBJECTS_ACTIONS[user_choice.to_sym], "Available objects actions:")
      actions_index = gets.chomp.to_i

      send(Config::Constants::OBJECTS_ACTIONS[user_choice.to_sym][actions_index], collection, index_object)
    end

    def create_route
      # TODO: Implement me
    end

    def create_station
      # TODO: Implement me
    end

    private

    def clear
      puts "\e[H\e[2J"
    end

    def taping_info(objects, title)
      return if objects.empty?

      puts title
      objects.each_with_index { |obj, index| puts "#{index} ----- #{obj.to_s}\n" }
    rescue StandardError => e
      raise Menu::InteractionMenuError, e.message
    end

    def show_available_objects
      @objects.each do |k, v|
        next if v.empty?

        puts "group: #{k} --- size: #{v.size}\n"
      end
    end
  end
end