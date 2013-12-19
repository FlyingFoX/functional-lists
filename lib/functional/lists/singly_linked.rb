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
        nodes
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

require 'minitest/autorun'

describe "SinglyLinked" do
  subject { Functional::Lists::SinglyLinked.new }

  describe "#push(object)" do
    it "must put the new object @ head" do
      subject.push("a")
      subject.head.object.must_equal "a"
      subject.tail.object.must_equal "a"

      subject.push "b"
      subject.head.object.must_equal "b"
      subject.tail.object.must_equal "a"

      subject.push "c"
      subject.head.object.must_equal "c"
      subject.tail.object.must_equal "a"
    end

    it "must set the next pointer" do
      subject.push("a")
      subject.head.object.must_equal "a"

      subject.push("b")
      subject.head.object.must_equal "b"
      subject.head.next.object.must_equal "a"
      
      subject.push("c")
      subject.head.object.must_equal "c"
      subject.head.next.object.must_equal "b"
      subject.tail.object.must_equal "a"
    end
  end

  describe "#to_a" do
    subject { Functional::Lists::SinglyLinked.new 1,2,3,4,5 }
    it "must place all nodes into an array" do
      subject.to_a.map(&:object).must_equal [5,4,3,2,1]
    end
  end
end

