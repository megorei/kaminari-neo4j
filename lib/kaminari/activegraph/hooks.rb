module Kaminari
  module ActiveGraph
    class Hooks
      def self.init
        ActiveSupport.on_load(:active_node) do
          ::ActiveGraph::Core::Query.send :include, Kaminari::ActiveGraph::Extension::InstanceMethods
          ::ActiveGraph::Node::Query::QueryProxy.send :include, Kaminari::ActiveGraph::Extension::InstanceMethods
          ::ActiveGraph::Node.send :include, Kaminari::ActiveGraph::Extension::ClassMethods
        end
      end
    end
  end
end
