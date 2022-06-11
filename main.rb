require './config/initialize'

loop do
  @menu.show

  puts "Enter command:"
  user_chose = gets.chomp

  if Config::Constants::AVAILABLE_ACTIONS.include?(user_chose)
    @menu.send(user_chose)
  end

  return if Config::Constants::EXIT_COMMANDS.include?(user_chose)
rescue Menu::Error => e
  puts "#{Config::Constants::AGAIN} #{e.message}"
  next
rescue StandardError => e
  puts "#{Config::Constants::CRASH}: #{e.message}"
  return
end