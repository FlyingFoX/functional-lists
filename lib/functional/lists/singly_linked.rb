module Functional
  module Lists

    class SinglyLinked

      attr_reader :head, :tail, :size

      def initialize(*objects)
        @head, @tail = nil, nil
        objects.each {|obj| push(obj) }
      end

      def push(object)
        node = Node.new(object, @head)
        @head = node
        @tail ||= @head
        self
      end

      def to_a
        nodes, node = [], @head
        while(node != nil)
          nodes << node
          node = node.next
        end
        nodes.reverse
      end

      class Node < Struct.new(:object, :next)
        attr_reader :object, :next

        def initialize(object, next_node=nil)
          @object, @next = object, next_node
        end
      end

    end

  end
end
