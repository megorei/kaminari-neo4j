module Kaminari
  class Hooks
    def self.init
      ActiveSupport.on_load(:active_node) do
        ::Neo4j::Core::Query.send :include, Kaminari::Neo4j::Extension
        ::Neo4j::ActiveNode::Query::QueryProxy.send :include, Kaminari::Neo4j::Extension
      end
    end
  end
end
