require_relative 'singly/push_pop'
require_relative 'singly/unshift_shift'

module Functional
  module Lists

    Node = Struct.new(:object, :next)

    class SinglyLinked
      include Singly::PushPop
      include Singly::UnshiftShift

      attr_reader :head, :tail, :count

      alias_method :size, :count
      alias_method :length, :count

      def initialize
        @head = @tail = nil
        @count = 0
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
