require './config/initialize'

def create_train(command)
  puts "Enter trains type: "
  trains_type = gets.chomp.to_s

  puts "Entre route: "
  trains_route = gets.chomp.to_s

  train =  Menu.send(command, trains_type, trains_route)

  !!train ? (puts "Create new train: #{train.type}") : (puts "Train wasn't created")
end

loop do
  puts "Available commands:"

  Config::Constants::AVAILABLE_ACTIONS.each do | _k, v|
    puts "----- #{v[:action]}\n"
  end

  puts "Enter command:"
  user_chose = gets.chomp

  if Config::Constants::AVAILABLE_ACTIONS.include?(user_chose.to_sym)
    send(user_chose, Config::Constants::AVAILABLE_ACTIONS[user_chose.to_sym][:action])
  end

  return if Config::Constants::EXIT_COMMANDS.include?(user_chose)
end