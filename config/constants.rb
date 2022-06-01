module Config
  module Constants
    AVAILABLE_ACTIONS = %w[create_train present_objects].freeze
    EXIT_COMMANDS = %w[exit].freeze
    OBJECTS_ACTIONS = {
      trains: %w[change_train_number]
    }.freeze
  end
end