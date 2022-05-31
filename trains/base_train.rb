module Trains
  class BaseTrain
    attr_reader :current_station, :number

    def initialize(number:)
      @number = number
      @current_station = 0
      @route = nil
    end

    protected

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

    def to_s
      "Train's number: #{@number}, train's type: #{@type}"
    end
  end
end