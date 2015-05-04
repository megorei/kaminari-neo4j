module Kaminari
  module Neo4j
    module Extension
      extend ActiveSupport::Concern

      included do
        # Fetch the values at the specified page number
        #   Model.page(5)
        eval <<-RUBY
          def #{Kaminari.config.page_method_name}(num = nil)
            Kaminari::Neo4j::Paginated.new(self, num)
          end
        RUBY
      end
    end
  end
end
