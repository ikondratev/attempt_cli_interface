module Menu
  module Commands
    module Train
      def change_train_number(collection, index)
        puts "Enter new number:"
        new_number = gets.chomp.to_i

        collection[index].number = new_number
        puts collection[index]
      end
    end
  end
end