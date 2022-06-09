module Menu
  module Commands
    module Train
      def change_train_number(collection, index)
        puts "Enter new number:"
        new_number = gets.chomp.to_i

        collection[index].number = new_number
        puts collection[index]
      rescue StandardError => e
        raise Menu::CommandsTrainError, e.message
      end

      def create_new_train
        puts "Enter trains type: [ #{Trains::BaseTrain.available_trains_types} ]"
        type = gets.chomp.to_s

        puts "Entre number:"
        number = gets.chomp.to_i

        Trains::Services::Factory.create_train(type: type, number: number)
      rescue BaseError => e
        raise Menu::CommandsTrainError, e.message
      end
    end
  end
end