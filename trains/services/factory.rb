module Trains
  module Services
    class Factory
      class << self
        def create_train(type:, number:)
          case type
          when Trains::Services::Constants::PASSENGER_TYPE
            Trains::PassengerTrain.new(number: number)
          when Trains::Services::Constants::CARGO_TYPE
            Trains::CargoTrain.new(number: number)
          else
            raise "Type is not allowed"
          end
        rescue  StandardError => e
          raise Trains::FactoryError.new, e.message
        end
      end
    end
  end
end