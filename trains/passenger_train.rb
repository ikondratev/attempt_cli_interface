module Trains
  class PassengerTrain < BaseTrain
    def initialize(number:)
      super

      @type = Trains::Services::Constants::PASSENGER_TYPE
    end
  end
end