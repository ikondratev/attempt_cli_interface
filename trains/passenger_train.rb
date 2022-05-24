module Trains
  class PassengerTrain < BaseTrain
    def initialize(route:)
      super

      @type = Trains::Services::Constants::PASSENGER_TYPE
    end
  end
end