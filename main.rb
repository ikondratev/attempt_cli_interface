require './config/initialize'

loop do
  @menu.show

  puts "Enter command:"
  user_chose = gets.chomp

  if Config::Constants::AVAILABLE_ACTIONS.include?(user_chose.to_sym)
    @menu.send(user_chose)
  end

  return if Config::Constants::EXIT_COMMANDS.include?(user_chose)
rescue StandardError => e
  puts "Try again: #{e.message}"
  next
end