module Config
  module Constants
    AVAILABLE_ACTIONS = %w[create_train present_objects].freeze
    AGAIN = "Try again ".freeze
    CRASH = "Something was wrong:"
    EXIT_COMMANDS = %w[exit].freeze
    OBJECTS_ACTIONS = {
      trains: %w[change_train_number delete_train]
    }.freeze
  end
end