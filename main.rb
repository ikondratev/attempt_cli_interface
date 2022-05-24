require './config/initialize'

menu = Menu.new

# add map for choosing type of actions
# ...
AVAILABLE_ACTIONS = { create_train: { title: "create new train by type", action: "create_train" } }.freeze

# It's just a simple example
# TODO: will create cli interface for adding params
# ...
user_chosen_action = "create_train".to_sym
user_added_train_type = "passengers"
user_added_route = "route"

# It's main flow for choosing action by user's params
# ...
if AVAILABLE_ACTIONS.include?(user_chosen_action)
  menu.send(AVAILABLE_ACTIONS[user_chosen_action][:action], user_added_train_type, user_added_route)
else
  puts "actions is not available"
end