module Kaminari
  module Neo4j
    class Paginated
      include Enumerable
      include Kaminari::Neo4j::CriteriaMethods
      include Kaminari::ConfigurationMethods::ClassMethods

      attr_accessor :source, :total, :current_page, :per_page

      delegate :each,   to: :items
      delegate :pluck,  to: :items
      delegate :[],     to: :items
      delegate :size,   to: :to_a

      def initialize(source, current_page, per_page = nil)
        self.source = source
        self.current_page = (current_page || 1).to_i
        self.per_page = (per_page || default_per_page).to_i
      end

      def total
        target  = target(source)
        if source.instance_of?(::Neo4j::Core::Query)
          source.reorder.with("#{target} as #{target}").pluck("COUNT(#{target})").first
        else
          source.count
        end
      end

      def items
        @items || source.skip((current_page - 1) * per_page).limit(per_page)
      end

      def self.create_from(source, page, per_page = 0)
        new(source, page, per_page)
      end

      def target(source)
        source.instance_of?(::Neo4j::Core::Query) ? return_var : source.identity
      end

      def per(num)
        self.class.create_from(source, current_page, num)
      end

      def pluck(*args)
        @items = source.pluck(*args)
        self
      end

      def return_var
        clause = source.instance_variable_get('@clauses').find { |c| c.is_a?(::Neo4j::Core::QueryClauses::ReturnClause) }
        clause.instance_variable_get('@arg')
      end

      def to_ary
        items.to_a
      end
    end
  end
end