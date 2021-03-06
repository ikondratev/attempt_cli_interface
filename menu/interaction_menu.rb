require './menu/commands/train'
require './menu/commands/support'

module Menu
  module Text
    AVAILABLE_COMMANDS = "Available commands:".freeze
    EXIT_COMMANDS = "Exit commands:".freeze
    AVAILABLE_OBJECTS = "Available objects:".freeze
    UNAVAILABLE_OBJECT = "Unavailable object".freeze
    AVAILABLE_OBJECTS_ACTIONS = "Available objects actions:".freeze
    CHOOSE_OBJECTS_GROUP = "Choose objects group:".freeze
    NOTHING_TO_VIEW = "Nothing to show".freeze
    CHOOSE_INDEX = "Choose index:".freeze
  end

  class InteractionMenu
    extend Menu::Commands::Train
    extend Menu::Commands::Support

    def initialize
      @objects = {
        trains: Trains::BaseTrain.items
      }
    end

    def create_train
      self.class.create_new_train
    rescue Menu::Error => e
      raise Menu::InteractionMenuError, e.message
    end

    def show
      self.class.clear
      self.class.taping_info(available_items, Menu::Text::AVAILABLE_OBJECTS)
      self.class.taping_info(Config::Constants::AVAILABLE_ACTIONS, Menu::Text::AVAILABLE_COMMANDS)
      self.class.taping_info(Config::Constants::EXIT_COMMANDS, Menu::Text::EXIT_COMMANDS)
    rescue Menu::Error => e
      raise Menu::InteractionMenuError, e.message
    end

    def present_objects
      raise Menu::Text::NOTHING_TO_VIEW if available_items.empty?

      self.class.clear
      self.class.taping_info(available_items, Menu::Text::CHOOSE_OBJECTS_GROUP)

      user_choice = gets.chomp.to_sym

      raise Menu::Text::UNAVAILABLE_OBJECT unless @objects.include?(user_choice.to_sym)

      collection = @objects[user_choice.to_sym]
      actions_by_collections_type(collection, user_choice)
    rescue StandardError => e
      raise Menu::InteractionMenuError, e.message
    end

    def actions_by_collections_type(collection, user_choice)
      self.class.taping_info(collection, user_choice, true)

      puts Menu::Text::CHOOSE_INDEX
      index_object = gets.chomp.to_i

      obj = collection[index_object]
      puts obj.to_s

      puts "#{Menu::Text::CHOOSE_INDEX} #{user_choice}"
      self.class.taping_info(
        Config::Constants::OBJECTS_ACTIONS[user_choice.to_sym],
        Menu::Text::AVAILABLE_OBJECTS_ACTIONS,
        true
      )
      actions_index = gets.chomp.to_i

      action_params = {
        collection: collection,
        user_choice: user_choice,
        index: index_object
      }

      self.class.send(
        Config::Constants::OBJECTS_ACTIONS[user_choice.to_sym][actions_index],
        action_params
      )
    rescue Menu::Error => e
      raise Menu::InteractionMenuError, e.message
    end

    private

    def available_items
      @objects.map { |key, obj| key if !obj.empty? }.compact
    end
  end
end