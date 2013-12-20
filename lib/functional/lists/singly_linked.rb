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
        node = Node.new(object, nil)
        if @head.nil?
          @head, @tail = node, node
        else
          @tail.next = node
          @tail = node
        end
        @count += 1
        self
      end
      alias_method :<<, :push

      def pop
        node, to_pop = @head, @tail
        until node.nil?
          if node.next == to_pop
            @count -= 1
            @tail = node
            @tail.next = nil
          end
          node = node.next
        end
        to_pop.object if to_pop
      end

      def unshift(object)
        node = Node.new(object, nil)
        if @head.nil?
          @head, @tail = node, node
        else
          @head.next = node
          @head = node
        end
        @count += 1
        self
      end

      def shift
        return unless @head
        to_shift = @head
        @head = to_shift.next if to_shift.next
        @count -= 1
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

    end

  end
end
