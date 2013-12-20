module Functional
  module Lists

    Node = Struct.new(:object, :next)

    class SinglyLinked
      attr_reader :head, :tail, :count

      alias_method :size, :count

      def initialize
        @head = @tail = nil
        @count = 0
      end

      def push(object)
        @head = Node.new(object, @head)
        @tail ||= @head
        @count += 1
        self
      end
      alias_method :unshift, :push
      alias_method :<<, :push

      def pop
        node, to_pop = @head, @tail
        until node.nil?
          set_tail(node) if node.next == to_pop
          node = node.next
        end
        to_pop.object
      end

      def shift
        to_shift = @head
        @head = @head.next
        to_shift.object
      end

      def to_a
        nodes, node = [], @head
        until node.nil?
          nodes.unshift node
          node = node.next
        end
        nodes
      end

    private

      def set_tail(node)
        @count -= 1
        @tail = node
        @tail.next = nil
      end

    end

  end
end
