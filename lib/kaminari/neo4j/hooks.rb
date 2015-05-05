module Kaminari
  module Neo4j
    class Hooks
      def self.init
        ActiveSupport.on_load(:active_node) do
          ::Neo4j::Core::Query.send :include, Kaminari::Neo4j::Extension::InstanceMethods
          ::Neo4j::ActiveNode::Query::QueryProxy.send :include, Kaminari::Neo4j::Extension::InstanceMethods
          ::Neo4j::ActiveNode.send :include, Kaminari::Neo4j::Extension::ClassMethods
        end
      end
    end
  end
end
