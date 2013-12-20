module Functional
  module Lists
    class SinglyLinked

      Node = Struct.new(:object, :next)

      attr_reader :head, :tail, :count

      alias_method :size, :count
      alias_method :length, :count

      def initialize
        @head = @tail = Node.new(nil)
        @count = 0
      end

      def push(object)
        node = Node.new(object) 
        @tail.next = node
        @tail      = node
        @head      = @tail if @head.object.nil?
        @count += 1
      end
      alias_method :<<, :push

      def pop
        node, to_pop = @head, @tail
        until node.nil?
          if node.next == to_pop
            @count -= 1
            node.next = nil
            @tail = node
          end
          node = node.next
        end
        to_pop.object if to_pop
      end

      def to_a
        nodes, node = [], @head
        while node
          nodes.unshift node
          node = node.next
        end
        nodes.map(&:object).compact
      end

    end

  end
end
