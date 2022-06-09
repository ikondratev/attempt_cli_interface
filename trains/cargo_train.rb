module Trains
  class CargoTrain < BaseTrain
    def initialize(number:)
      super

      @type = Trains::Services::Constants::CARGO_TYPE
    end
  end
end