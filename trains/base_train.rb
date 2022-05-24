module Trains
  class BaseTrain
    attr_reader :current_station, :type

    def initialize(route:)
      @route = route
      @current_station = 0
    end

    def next_station
      return if @route.stations.empty?
      return if @current_station + 1 >= @route.stations.size

      @route.stations[@current_station + 1]
    end

    def previous_station
      return if @route.stations.empty?
      return unless @current_station.positive?

      @route.stations[@current_station - 1]
    end

    def back
      return unless next_station

      @current_station += 1
    end

    def move
      return unless previous_station

      @current_station -= 1
    end
  end
end