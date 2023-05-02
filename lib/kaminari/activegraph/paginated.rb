module Kaminari
  module ActiveGraph
    class Paginated
      include Enumerable
      include Kaminari::ActiveGraph::CriteriaMethods
      include Kaminari::ConfigurationMethods::ClassMethods

      attr_accessor :source, :total, :current_page, :per_page

      delegate :each,   to: :items
      delegate :pluck,  to: :items
      delegate :[],     to: :items
      delegate :size,   to: :to_a

      def initialize(source, current_page, per_page = nil)
        self.source = source
        self.current_page = (current_page || 1).to_i
        self.current_page = 1 if self.current_page < 1
        self.per_page = (per_page || default_per_page).to_i
      end

      def total
        source.count
      end

      def items
        @items || source.skip((current_page - 1) * per_page).limit(per_page)
      end

      def method_missing(name, *args, &block)
        items.respond_to?(name) ? items.send(name, *args, &block) : super
      end

      def self.create_from(source, page, per_page = 0)
        new(source, page, per_page)
      end

      def per(num)
        self.class.create_from(source, current_page, num)
      end

      def pluck(*args)
        @items = source.pluck(*args)
        self
      end

      def to_ary
        items.to_a
      end
    end
  end
end
