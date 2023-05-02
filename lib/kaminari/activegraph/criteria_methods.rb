module Kaminari
  module ActiveGraph
    module CriteriaMethods
      include Kaminari::PageScopeMethods

      delegate :model, to: :source
      delegate :default_per_page, :max_per_page, :max_pages, to: :model

      def entry_name
        model.model_name.human.downcase
      end

      def limit_value
        per_page
      end

      def offset_value
        (current_page - 1) * per_page
      end

      def total_count
        total
      end
    end
  end
end
