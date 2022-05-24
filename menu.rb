class Menu
  # @param [String] type
  # @param [Route] route
  #
  # @return [Trains::BaseTrain]
  def create_train(type, route)
    Trains::Services::Factory.create_train(type: type, route: route)
  end

  def create_route
    # TODO: Implement me
  end

  def create_station
    # TODO: Implement me
  end
end