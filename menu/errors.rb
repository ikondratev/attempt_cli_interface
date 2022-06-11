module Menu
  class Error < StandardError; end

  class InteractionMenuError < Error; end

  class CommandsTrainError < Error; end

  class CommandsSupportError < Error; end
end
