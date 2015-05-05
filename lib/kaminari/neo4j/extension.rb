module Kaminari
  module Neo4j
    module Extension
      module QueryMethods
        eval <<-RUBY
          def #{Kaminari.config.page_method_name}(num = nil)
            Kaminari::Neo4j::Paginated.new(self, num)
          end
        RUBY
      end

      module InstanceMethods
        extend ActiveSupport::Concern

        included do
          include QueryMethods
        end
      end

      module ClassMethods
        extend ActiveSupport::Concern

        included do
          extend QueryMethods
        end
      end
    end
  end
end
