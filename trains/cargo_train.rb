module Trains
  class CargoTrain < BaseTrain
    def initialize(route:)
      super

      @type = Trains::Services::Constants::CARGO_TYPE
    end
  end
end