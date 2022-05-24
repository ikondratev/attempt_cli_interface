module Trains
  module Services
    class Factory
      class << self
        def create_train(type:, route:)
          case type
          when Trains::Services::Constants::PASSENGER_TYPE
            Trains::PassengerTrain.new(route: route)
          when Trains::Services::Constants::CARGO_TYPE
            Trains::CargoTrain.new(route: route)
          else
            raise "Type is not allowed"
          end
        rescue StandardError => e
          puts "#{e.message}"
          nil
        end
      end
    end
  end
end