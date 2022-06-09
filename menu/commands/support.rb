module Menu
  module Commands
    module Support
      CURSOR = "---->".freeze

      def clear
        puts "\e[H\e[2J"
      end

      def taping_info(objects, title, indexing = false)
        return if objects.empty?

        puts title
        objects.each_with_index do |obj, index|
          ind = indexing ?  index : "|"
          puts "#{ind} #{CURSOR} #{obj.to_s}\n"
        end
      rescue StandardError => e
        raise Menu::CommandsSupportError, e.message
      end
    end
  end
end