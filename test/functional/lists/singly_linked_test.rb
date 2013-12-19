require 'test_helper'
require 'functional/lists/singly_linked'

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
      subject.to_a.map(&:object).must_equal [1,2,3,4,5]
    end
  end
end

